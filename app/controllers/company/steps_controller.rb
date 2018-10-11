class Company::StepsController < ApplicationController
  before_action :try_sign_in_company, only: [:terms]

  def login_or_register
    @company = Company.new
    # redirect_to company_home_path if current_company.present?
  end

  def terms
    @header_options = {style: :with_logo_back_button}
  end

  def create_company
    @company = Company.new(company_params)
    @company.company_about = CompanyAbout.new

    if @company.save
      sign_in(@company)
      redirect_to company_terms_path
    else
      render action: :login_or_register
    end
  end

  private
    def company_params
      params.require(:company).permit(:email, :password, :password_confirmation, :cpf_cnpj)
    end

    def try_sign_in_company
      company = Company.find_by_cpf_cnpj(params[:cpf_cnpj])

      return false if     company.nil?
      return false unless company.valid_password?(params[:password])

      sign_in(company)

      # redirect_to company_home_path
    end

    def valid_cpf_or_cnpj
      (company_params[:cpf_cnpj].length <= 14 && CPF.valid?(company_params[:cpf_cnpj])) ||
      (company_params[:cpf_cnpj].length > 14  && CNPJ.valid?(company_params[:cpf_cnpj]))
    end
end