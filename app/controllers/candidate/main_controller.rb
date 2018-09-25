class Candidate::MainController < ApplicationController
  def home
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}
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

  private
  def candidate_params 
    params.require(:candidate).permit(:candidate_avatar)
  end
end