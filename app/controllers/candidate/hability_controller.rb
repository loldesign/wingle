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
    if @candidate_hability.nil?
      @candidate.build_candidate_hability
      @candidate_hability = @candidate.candidate_hability
      @candidate_hability.save
    end
    if hability_params.present? && !@candidate_hability.update_attributes(hability_params)
      render action: :first
    end

    @candidate.completed_habilities! if @candidate.reload.habilities?
    
    redirect_to candidate_home_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_hability = @candidate.candidate_hability
    end

    def hability_params
      params.fetch(:candidate_hability, {}).permit(areas: [])
    end
end