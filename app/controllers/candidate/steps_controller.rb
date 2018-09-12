class Candidate::StepsController < ApplicationController
  before_action :authenticate_candidate!, except: [:login_or_register, :quick_details, :complete_register]
  before_action :set_candidate, only: [:terms]

  def quick_details
    session[:cpf]      = params[:cpf]
    session[:password] = params[:password]
  end

  def terms
    @header_options = {style: :with_logo_back_button}

    if @candidate_interest.cities == []
      @link_url = candidate_welcome_message_path
    else
      @link_url = candidate_interest_step_1_path
    end
  end

  def complete_register
    @candidate = Candidate.new
    @candidate.build_candidate_interest
    @candidate.cpf = session[:cpf]

    @cities =  City.all
    @areas  =  Area.all
  end

  def welcome_message
    @header_options = {style: :with_logo_back_button, back_button: false}
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_interest = @candidate.candidate_interest
    end
end
