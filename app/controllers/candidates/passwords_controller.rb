# frozen_string_literal: true

class Candidates::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    if candidate_params[:cpf].present?
      @candidate = Candidate.find_by(cpf: candidate_params[:cpf])
      @candidate.send_reset_password_instructions
    else
      @candidate = Candidate.send_reset_password_instructions(candidate_params)
    end
    yield @candidate if block_given?

    if successfully_sent?(@candidate)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(@candidate))
    else
      respond_with(@candidate)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  def after_resetting_password_path_for(resource)
    candidate_home_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    candidate_user_login_path if is_navigational_format?
  end

  private
  def candidate_params
    params.require(:candidate).permit(:email, :cpf)
  end
end
