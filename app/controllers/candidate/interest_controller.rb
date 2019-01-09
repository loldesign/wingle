class Candidate::InterestController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :complete]
  before_action :set_header_options, only: [:first, :second, :third, :fourth, :fifth]

  def transition
    @header_options = {style: :only_logo_header}
  end

  def first
    TermAcceptPublishedManager.new(resource: @candidate).process

    @city = City.all

    if @candidate_interest.cities == []
      @link_url = candidate_welcome_message_path
    else
      @link_url = candidate_terms_path
    end
  end

  def second
    if params_present_but_not_updated
      render action: :first
    end

    @company_size = CompanySize.all
  end

  def third
    if params_present_but_not_updated
      render action: :second
    end

    @sector = Sector.all
  end

  def fourth
    if params_present_but_not_updated
      render action: :third
    end

    @mode = Mode.all
  end

  def fifth
    if params_present_but_not_updated
      render action: :fourth
    end

    @header_options = {style: :with_logo_back_button}
    @relevance = Relevance.order(priority: :asc)
  end

  def complete
    if params_present_but_not_updated
      render action: :fifth
    end

    @candidate.completed_interest! if @candidate.reload.interest?

    redirect_to candidate_experience_step_1_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_interest = @candidate.candidate_interest
    end

    def set_header_options
      @header_options = {style: :with_logo_back_button}
    end

    def candidate_interest_params
      params.fetch(:candidate_interest, {}).permit(locales: [], neighborhoods: [], company_sizes: [], sectors: [], modes: [], relevances: [])
    end

    def params_present_but_not_updated
      candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
    end
end
