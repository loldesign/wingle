class Company::AboutController < ApplicationController
  before_action :authenticate_company!
  before_action :set_company, only: [:first, :second, :third, :fourth, :complete]

  def first
    TermAcceptPublishedManager.new(resource: @company).process

    @company_size = CompanySize.all
  end

  def second
    if params_present_but_not_updated
      render action: :first
    end

    @sector = Sector.all
  end

  def third
    if params_present_but_not_updated
      render action: :second
    end
    @mode = Mode.all
  end

  def fourth
    if params_present_but_not_updated
      render action: :third
    end
    @city = City.all
  end

  def complete
    if params_present_but_not_updated
      render action: :fourth
    end

    redirect_to company_home_path
  end

  private
    def company_about_params
      params.fetch(:company_about, {}).permit(:company_size_id, :mode_id, sectors: [], neighborhoods: [])
    end

    def set_company
      @company = current_company
      @company_about = @company.company_about
    end

    def params_present_but_not_updated
      company_about_params.present? && !@company_about.update_attributes(company_about_params)
    end
end
