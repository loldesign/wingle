class Candidate::MainController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate

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

  def update_avatar
    if current_candidate.update_attributes(candidate_params)
      redirect_to candidate_profile_path(current_candidate)
    else
      render :edit
    end
  end

  def update_curriculum
    if current_candidate.update_attributes(candidate_curriculum_param)
      redirect_to candidate_profile_path(current_candidate)
    else
      render :edit
    end
  end

  private
  def set_candidate
    @candidate = current_candidate
  end
  
  def candidate_params 
    params.require(:candidate).permit(:candidate_avatar)
  end

  def candidate_curriculum_param
    params.require(:candidate).permit(:candidate_curriculum)
  end
end