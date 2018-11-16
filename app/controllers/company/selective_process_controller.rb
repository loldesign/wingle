class Company::SelectiveProcessController < ApplicationController
  before_action :load_process_selection, except: [:info]
  before_action :get_candidates, except: [:info]

  def index
    @header_options = {style: :company_full_header}
  end

  def info
    @info = ProcessSelectionManager::Info.new(owner: current_company).process

    render json: @info
  end

  private
  def load_process_selection
    @process_selection = ProcessSelectionManager::List.new(owner: current_company).active
  end

  def get_candidates
    levels = {
      "interessado":  :first_level,
      "1-etapa":      :second_level,
      "2-etapa":      :third_level,
      "ultima-etapa": :fourth_level,
      "proposta":     :proposal,
      "aprovados":    :proposal_accepted,
      "ignorados":    :ignored
    }

    @candidate_process_selection = @process_selection.candidate_process_selections.where(state: levels[params[:state].to_sym]).order(created_at: :desc)
  end
end
