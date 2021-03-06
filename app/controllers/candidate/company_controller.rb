class Candidate::CompanyController < ApplicationController 
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :complete]

  def first
    @current_company = @candidate_current_company.present? ? @candidate_current_company : CandidateCurrentCompany.new
    load_size_sector_and_profile
    @city = City.all
    @city_locale = CityLocale.all
    @neighborhood_group = NeighborhoodGroup.all
    @months = arrayForSelect(1, 12)
    @years  = arrayForSelect(1990, Date.today.year)

    if @current_company.sector.present?
      @subsectors = Subsector.where(sector_id: @current_company.sector)
    end

    @neighborhoods =[]
    if @current_company.neighborhood_group.present?
      @neighborhoods = Neighborhood.where(neighborhood_group_id: @current_company.neighborhood_group)
    end
  end

  def second
    @current_company = @candidate_current_company

    if @candidate_current_company.nil?
      CandidateManager.new(candidate: @candidate).create_candidate_current_company
      @current_company = @candidate.candidate_current_company
    end

    @months = arrayForSelect(1, 12)
    @years  = arrayForSelect(1990, Date.today.year)

    if params[:candidate_current_company].present?
      manager = CandidateManager.new(candidate_current_company: @current_company, candidate_current_company_params: candidate_current_company_params)
      saved = manager.update_candidate_current_companies
      if !saved
        @start_date_error_present = @current_company.errors.present? && (@current_company.errors[:start_date_month].present? || @current_company.errors[:start_date_year].present? || @current_company.errors[:start_date].present?)
        @end_date_error_present   = @current_company.errors.present? && (@current_company.errors[:end_date_month].present? || @current_company.errors[:end_date_year].present?)
        load_size_sector_and_profile
        @city = City.all
        @city_locale = CityLocale.all
        @neighborhood = Neighborhood.all
        render action: :first
      end
    end

    @companies = @candidate_companies.empty? ? [CandidateCompany.new] : @candidate_companies
  end

  def third
    manager = CandidateManager.new(candidate: @candidate, candidate_company_params: candidate_company_params)
    manager.create_or_update_candidate_companies

    if !@candidate.valid? || @candidate.candidate_companies.empty?
      redirect_to action: :first
    else
      @companies = @candidate.candidate_companies
      load_size_sector_and_profile
      @subsectors = Subsector.all

      @neighborhood_group = NeighborhoodGroup.all
      @neighborhoods = Neighborhood.all
    end
  end

  def complete
    manager = CandidateManager.new(candidate_company_params: candidate_company_params)
    saved   = manager.update_all_candidate_companies
    if !saved
      redirect_to action: :second
    else
      @candidate.completed_companies! if @candidate.reload.companies?

      redirect_to candidate_hability_step_1_path
    end
  end

  def neighborhoods
    neighborhood_group = NeighborhoodGroup.find(params[:neighborhood_group_id])

    if neighborhood_group.present?
      @neighborhoods = neighborhood_group.neighborhoods

      render json: @neighborhoods
    else
      render json: {status: 422}
    end
  end

  def subsectors
    sector = Sector.find(params[:sector_id])

    if sector.present?
      @subsectors = sector.subsectors

      render json: @subsectors
    else
      render json: {status: 422}
    end
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_companies = @candidate.candidate_companies
      @candidate_current_company = @candidate.candidate_current_company
    end

    def candidate_company_params
      if params[:candidate_companies].present?
        params.fetch(:candidate_companies, {}).map do |p|
          p.permit(:id, :name, :months, :nationality, :size, :sector, :subsector,
            :title, :neighborhood_group, :neighborhood,
            :start_date_month, :start_date_year, :end_date_month, :end_date_year
          )
        end
      end
    end

    def candidate_current_company_params
      params.fetch(:candidate_current_company, {}).permit(:id, :name, :start_date, :end_date, :start_date_month, :start_date_year, :end_date_month, :end_date_year, :currently_work_here, :nationality, :company_size, :sector, :subsector, :mode, :city, :city_locale, :neighborhood_group, :neighborhood, :corporate_email)
    end

    def arrayForSelect(min, max)
      array = []
      for i in min..max
        if i < 10
          array << ["0#{i}", "#{i}"]
        else
          array << ["#{i}", "#{i}"]
        end
      end
      array
    end

    def load_size_sector_and_profile
      @size       = CompanySize.all
      @sector     = Sector.all
      @subsectors = []
      @profile    = Mode.all
    end
end