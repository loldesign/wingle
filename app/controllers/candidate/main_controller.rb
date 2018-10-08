class Candidate::MainController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate
  before_action :validate_params, only: :update_profile

  def home
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}

    @sectors       = Sector.where("id IN (?)", @candidate.candidate_interest.sectors)
    @company_sizes = CompanySize.where("id IN (?)", @candidate.candidate_interest.company_sizes)
    @modes         = Mode.where("id IN (?)", @candidate.candidate_interest.modes)
    @city_locales  = CityLocale.joins(:neighborhoods).where('neighborhoods.id IN (?)', @candidate.candidate_interest.neighborhoods).distinct
  end

  def profile
    @current_company = @candidate.candidate_current_company
    @header_options  = {style: :dashboard_header}
    @tab_bar         = {style: :with_tab_bar}
  end

  def update_profile
    @current_company = @candidate.candidate_current_company

    if current_candidate.update_attributes(candidate_params) && (params[:candidate_current_company].present? && @current_company.update_attributes(candidate_current_company_params))
      redirect_to candidate_profile_path(current_candidate)
    else
      @header_options = {style: :dashboard_header}
      @tab_bar        = {style: :with_tab_bar}
      
      render :profile
    end
  end

  private
  def validate_params
    redirect_to candidate_profile_path(current_candidate) unless params[:candidate].present?
  end

  def set_candidate
    @candidate = current_candidate
  end
  
  def candidate_params 
    params.require(:candidate).permit(:candidate_avatar, :candidate_curriculum, :new_challenges, :employed)
  end

  def candidate_current_company_params
    params.require(:candidate_current_company).permit(:corporate_email)
  end
end