class Candidate::InterestController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :complete]

  def first
    @header_options = {style: :with_logo_back_button}

    @city = City.all

    if @candidate_interest.cities == []
      @link_url = candidate_welcome_message_path
    else
      @link_url = candidate_terms_path
    end
  end

  def second
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
      render action: :first
    end

    @header_options = {style: :with_logo_back_button}

    @company_size = CompanySize.all
  end

  def third
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
      render action: :second
    end

    @header_options = {style: :with_logo_back_button}

    @sector = Sector.all
  end

  def fourth
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
      render action: :third
    end

    @header_options = {style: :with_logo_back_button}

    @mode = Mode.all
  end

  def fifth
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
      render action: :fourth
    end

    @header_options = {style: :with_logo_back_button}

    @relevance = Relevance.order(priority: :asc)
  end

  def complete
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)

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

    def candidate_interest_params
      params.fetch(:candidate_interest, {}).permit(locales: [], company_sizes: [], sectors: [], modes: [], relevances: [])
    end
end
