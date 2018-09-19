class Candidate::CompanyController < ApplicationController 
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :complete]

  def first
    
  end

  def second
    # if params[:current_items] not present, 'count' will be 0
    # so it wont get into the loop
    count = params[:current_items].to_i
    while count > 0
      company = CandidateCompany.new(candidate_company_params(count))
      raise ActiveRecord::Rollback if !company.valid?
      @candidate.candidate_companies << company
      count -= 1
    end

    if @candidate.candidate_companies.empty?
      redirect_to action: :first
    else
      @companies = @candidate.candidate_companies
      @size = CompanySize.all
      @sector = Sector.all
      @profile = TitleList.all
    end
  end

  def complete
    candidate_params[:candidate_companies].each do |company|
      candidate_company = CandidateCompany.find(company[:id])
      candidate_company.update_attributes(company)
      # verify if return false?
    end
    redirect_to candidate_hability_step_1_path
  end

  private
    def set_candidate
      @candidate = current_candidate
    end

    def candidate_company_params(n)
      param_name = "candidate_company_#{n-1}"
      params.fetch(param_name.to_sym, {}).permit(:name, :years, :months)
    end

    def candidate_params
      params.permit(candidate_companies: [:id, :size, :sector, :title])
    end
end