class Candidate::StepsController < ApplicationController 
  before_action :authenticate_candidate!, except: [:login_or_register, :terms, :quick_details, :complete_register]
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :complete]

  def terms
    @header_options = {style: :with_logo_back_button}
  end

  def welcome_message
    @header_options = {style: :with_logo_back_button, back_button: false}

    # TODO: verify if candidate has interest in a state other than SP
    #@candidate = current_candidate
    #if @candidate.state_interest != 'SP'
    #  redirect_to candidate_first_path
    #end
  end

  def first
    @header_options = {style: :with_logo_back_button}

    @city = City.all
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

    @relevance = Relevance.all
  end

  def complete
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)
      render action: :fifth
    end
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