class Company::CandidateController < ApplicationController
  before_action :load_process_selection
  before_action :get_candidate, except: [:update_candidate_status]

  def profile
    @header_options = {style: :company_full_header}
    @manager        =  CandidateInfoManager.new(candidate: @candidate)
  end

  def update_state
    @candidate_process_selection = @process_selection.candidate_process_selections.where(candidate_id: params[:candidate_id]).first

    @candidate_process_selection.update_attributes(state: params[:state])

    render json: {success: true}
  end

  private
  def load_process_selection
    @process_selection = ProcessSelectionManager::List.new(owner: current_company).active
  end

  def get_candidate
    if params[:id].present?
      @candidate_process_selection = @process_selection.candidate_process_selections.order(created_at: :desc).where(candidate_id: params[:id]).first
    else
      @candidate_process_selection = @process_selection.candidate_process_selections.order(created_at: :desc).sample
    end

    @candidate = @candidate_process_selection.candidate
  end
end
