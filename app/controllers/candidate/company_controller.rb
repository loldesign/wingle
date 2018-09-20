class Candidate::CompanyController < ApplicationController 
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :complete]

  def first
    @companies = @candidate_companies.empty? ? [CandidateCompany.new] : @candidate_companies

    @years = []
    @months = []
    for i in 0..11
      if i == 1
        @years << ["#{i} ANO", "#{i}"]
        @months << ["#{i} MÊS", "#{i}"]
      else
        @years << ["#{i} ANOS", "#{i}"]
        @months << ["#{i} MESES", "#{i}"]
      end
    end
  end

  def second
    if candidate_company_params.present?
      CandidateCompany.transaction do
        candidate_company_params.each do |co|
          if co[:id].present? && co[:name].present?
            company = CandidateCompany.update(co[:id], co)
          elsif co[:id].present? && co[:name].nil?
            company = CandidateCompany.destroy(co[:id])
          else
            company = CandidateCompany.new(co)
            @candidate.candidate_companies << company
          end
          raise ActiveRecord::Rollback if !company.save
        end
      end
    end

    if !@candidate.valid? || @candidate.candidate_companies.empty?
      redirect_to action: :first
    else
      @companies = @candidate.candidate_companies
      @size = CompanySize.all
      @sector = Sector.all
      @profile = TitleList.all
    end
  end

  def complete
    candidate_company_params.each do |company|
      candidate_company = CandidateCompany.find(company[:id])
      saved = candidate_company.update_attributes(company)
      if !saved
        render action: :second
      end
    end
    redirect_to candidate_hability_step_1_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_companies = @candidate.candidate_companies
    end

    def candidate_company_params
      if params[:candidate_companies].present?
        params.fetch(:candidate_companies, {}).map do |p|
          p.permit(:id, :name, :years, :months,
            :size, :sector, :title
          )
        end
      end
    end
end