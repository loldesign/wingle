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
    @city_locales  = CityLocale.where("id IN (?)", @candidate.candidate_interest.locales)
  end

  def profile
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}
  end

  def update_profile
    if current_candidate.update_attributes(candidate_params)
      redirect_to candidate_profile_path(current_candidate)
    else
      render :edit
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
    params.require(:candidate).permit(:candidate_avatar, :candidate_curriculum, :new_challenges, :employed, :corporate_email)
  end
end