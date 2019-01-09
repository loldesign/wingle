class Candidate::StepsController < ApplicationController
  before_action :authenticate_candidate!, except: [:login_or_register, :quick_details, :complete_register, :create_candidate]
  before_action :try_sign_in_candidate, only: [:quick_details]
  before_action :set_candidate, only: [:terms]
  before_action :set_candidate_term, only: [:terms]

  def login_or_register
    @header_options = {style: :only_logo}

    redirect_to candidate_home_path if current_candidate.present?
  end

  def pre_register 
    @header_options = {style: :only_title}
  end

  def quick_details
    if CPF.valid?(params[:cpf])
      session[:cpf]      = params[:cpf]
      session[:password] = params[:password]
    else
      @errors = {cpf: 'número inválido'}

      render action: :login_or_register
    end
  end

  def terms
    @header_options = {style: :with_logo_back_button}

    if @candidate_interest.cities.first.present?
      # @link_url = candidate_interest_step_1_path
      @link_url = candidate_first_transition_path
    else
      @link_url = candidate_welcome_message_path
    end
  end

  def complete_register
    @candidate = Candidate.new
    @candidate.build_candidate_interest
    @candidate.cpf = session[:cpf]
    @candidate.password = session[:password]

    @cities =  City.all
    @areas  =  Area.all
  end

  def create_candidate
    @candidate = Candidate.new(candidate_params)
    @candidate.candidate_interest = CandidateInterest.new(candidate_interest_params)

    if @candidate.save
      session[:cpf] = nil
      session[:password] = nil
      sign_out(current_company) if current_company
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

    def try_sign_in_candidate
      candidate = Candidate.find_by_cpf(params[:cpf])

      return false if     candidate.nil?
      return false unless candidate.valid_password?(params[:password])

      sign_out(current_company) if current_company
      sign_in(candidate)

      redirect_to candidate_home_path
    end

    def set_candidate_term
      @current_term = Term
                        .with_for(@candidate.class.name.underscore.to_sym)
                        .published
                        .order(created_at: :desc)
                        .first
    end
end
