class Company::StepsController < ApplicationController
  before_action :try_sign_in_company, only: [:create_company]
  before_action :set_company_term   , only: [:terms]

  def login_or_register
    @company = Company.new
    redirect_to company_home_path if current_company.present?
  end

  def terms
    @header_options = {style: :with_logo_back_button}
  end

  def create_company
    @company = Company.new(company_params)
    @company.company_about = CompanyAbout.new

    if @company.save
      ProcessSelectionManager::Create.new(company: @company, owner: @company).process

      sign_out(current_candidate) if current_candidate

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
      company = Company.find_by_cpf_cnpj(company_params[:cpf_cnpj])

      return false if     company.nil?
      return false unless company.valid_password?(company_params[:password])

      sign_out(current_candidate) if current_candidate
      sign_in(company)

      redirect_to company_home_path
    end

    def valid_cpf_or_cnpj
      (company_params[:cpf_cnpj].length <= 14 && CPF.valid?(company_params[:cpf_cnpj])) ||
      (company_params[:cpf_cnpj].length > 14  && CNPJ.valid?(company_params[:cpf_cnpj]))
    end

    def set_company_term
      @current_term = Term
                        .with_for(Company.name.underscore.to_sym)
                        .published
                        .order(created_at: :desc)
                        .first
    end
end
