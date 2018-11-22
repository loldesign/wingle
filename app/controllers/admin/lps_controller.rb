class Admin::LpsController < ApplicationController

  def candidates
    @candidates = LpsCandidate.order(created_at: :desc).page(params[:page] || 1).per_page(50)
  end

  def companies
    @companies = LpsCompany.order(created_at: :desc).page(params[:page] || 1).per_page(50)
  end
end
