class Candidate::StepsController < ApplicationController
  before_action :authenticate_candidate!, except: [:login_or_register, :quick_details, :complete_register]
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :complete, :terms]

  def quick_details
    session[:cpf]      = params[:cpf]
    session[:password] = params[:password]
  end

  def terms
    @header_options = {style: :with_logo_back_button}

    if @candidate_interest.cities == []
      @link_url = candidate_welcome_message_path
    else
      @link_url = candidate_step_1_path
    end
  end

  def complete_register
    @candidate = Candidate.new
    @candidate.build_candidate_interest
    @candidate.cpf = session[:cpf]

    @cities =  City.all
    @areas  =  Area.all
  end

  def create_candidate
    @candidate = Candidate.new(candidate_params)
    @candidate.candidate_interest = CandidateInterest.new(candidate_interest_params)

    if @candidate.save
      session[:cpf] = nil
      sign_in(@candidate)
      redirect_to candidate_terms_path
    else
      @cities =  City.all
      @areas  =  Area.all

      render action: :complete_register
    end
  end

  def welcome_message
    @header_options = {style: :with_logo_back_button, back_button: false}
  end

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

    @relevance = Relevance.all
  end

  def complete
    if candidate_interest_params.present? && !@candidate_interest.update_attributes(candidate_interest_params)

      render action: :fifth
    end

    @candidate.completed_interest! if @candidate.reload.interest?
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_interest = @candidate.candidate_interest
    end

    def candidate_interest_params
      params.fetch(:candidate_interest, {}).permit(cities: [], areas: [], locales: [], company_sizes: [], sectors: [], modes: [], relevances: [])
    end

    def candidate_params
      params.require(:candidate).permit(:email, :password, :password_confirmation, :name, :cellphone, :cpf)
    end
end
