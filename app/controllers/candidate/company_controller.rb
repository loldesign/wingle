class Candidate::CompanyController < ApplicationController 
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :complete]

  def first
    @companies = @candidate_companies.empty? ? [CandidateCompany.new] : @candidate_companies

    @years  = CandidateManager.new.optionsForSelectYear
    @months = CandidateManager.new.optionsForSelectMonth
  end

  def second
    manager = CandidateManager.new(candidate: @candidate, candidate_company_params: candidate_company_params)
    manager.create_or_update_candidate_companies

    if !@candidate.valid? || @candidate.candidate_companies.empty?
      redirect_to action: :first
    else
      @companies = @candidate.candidate_companies
      @size = CompanySize.all
      @sector = Sector.all
      @profile = Mode.all
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