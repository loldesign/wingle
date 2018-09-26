class Candidate::PretensionController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :complete]

  def first
    @salary_list = NofsalariesList.all
  end

  def second
    if @candidate_pretension.nil?
      @candidate.build_candidate_pretension
      @candidate_pretension = @candidate.candidate_pretension
      @candidate_pretension.save
    end
    if candidate_pretension_params.present? && !@candidate_pretension.update_attributes(candidate_pretension_filtered_params)
      render action: :first
    end

    @benefits = BenefitsList.all
  end

  def third
    if candidate_pretension_params.present? && !@candidate_pretension.update_attributes(candidate_pretension_params)
      render action: :second
    end

    @claim = AnnualClaimRateList.all
  end

  def complete
    if candidate_pretension_params.present? && !@candidate_pretension.update_attributes(candidate_pretension_filtered_params)
      render action: :third
    end

    @candidate.completed! if @candidate.reload.pretension?

    redirect_to candidate_home_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_pretension = @candidate.candidate_pretension
    end

    def candidate_pretension_params
      params.fetch(:candidate_pretension, {}).permit(:last_monthly_salary, :nofsalaries, :variable, :last_salary_total, :pretension_minimum_percent, :pretension_yearly_total, :minimum_claim, benefits: [])
    end

    def candidate_pretension_filtered_params
      pretension_params = candidate_pretension_params
      pretension_params[:last_monthly_salary] = candidate_pretension_params[:last_monthly_salary].gsub('R$ ', '').gsub('.', '').gsub(',', '.')  if pretension_params[:last_monthly_salary].present?
      pretension_params[:variable]            = candidate_pretension_params[:variable].gsub('R$ ', '').gsub('.', '').gsub(',', '.')  if pretension_params[:variable].present?
      pretension_params[:last_salary_total]   = candidate_pretension_params[:last_salary_total].gsub('R$ ', '').gsub('.', '').gsub(',', '.')
      pretension_params[:minimum_claim]       = candidate_pretension_params[:minimum_claim].gsub('R$ ', '').gsub('.', '').gsub(',', '.') if pretension_params[:minimum_claim].present?
      pretension_params[:pretension_yearly_total]  = candidate_pretension_params[:last_salary_total].gsub('R$ ', '').gsub('.', '').gsub(',', '.')
      return pretension_params
    end
end