class Candidate::HabilityController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :complete]

  def first
    if @candidate.candidate_experience.areas.present?
      @area = Area.where("id IN (?)", @candidate.candidate_experience.areas)
    else
      # to set areas
      redirect_to candidate_experience_step_3
    end
  end

  def complete
    
    redirect_to candidate_home_path
  end

  private
    def set_candidate
      @candidate = current_candidate
    end

    def hability_params
      params.require(:habilities).permit(areas: [])
    end
end