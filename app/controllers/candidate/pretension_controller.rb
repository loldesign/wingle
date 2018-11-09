class Candidate::PretensionController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :complete]

  def first
    @salary_list = NofsalariesList.all
    @claim = AnnualClaimRateList.all
    @candidate_pretension = @candidate.build_candidate_pretension if @candidate_pretension.nil?
    rounded = @candidate_pretension.last_salary_total.present? ? (@candidate_pretension.last_salary_total/1000).ceil : 0
    @last_salary_total = rounded * 1000
    @selected = @candidate_pretension.pretension_minimum_percent.present? ? @candidate_pretension.pretension_minimum_percent : false
  end

  def second
    if @candidate_pretension.nil?
      CandidateManager.new(candidate: @candidate).create_candidate_pretension
      @candidate_pretension = @candidate.candidate_pretension
    end

    if params_present_but_not_updated_filtered
      render action: :first
    end

    @benefits = BenefitsList.all
  end

  def complete
    if params_present_but_not_updated
      render action: :second
    end

    @candidate.completed! if @candidate.reload.pretension?

    redirect_to candidate_home_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_pretension = @candidate.candidate_pretension
    end

    def params_present_but_not_updated
      candidate_pretension_params.present? && !@candidate_pretension.update_attributes(candidate_pretension_params)
    end

    def params_present_but_not_updated_filtered
      candidate_pretension_params.present? && !@candidate_pretension.update_attributes(candidate_pretension_filtered_params)
    end

    def candidate_pretension_params
      params.fetch(:candidate_pretension, {}).permit(:last_monthly_salary, :nofsalaries, :variable, :last_salary_total, :pretension_minimum_percent, :pretension_yearly_total, :minimum_claim, :bonus_or_plr, :total_pretended_from, benefits: [])
    end

    def candidate_pretension_filtered_params
      pretension_params = candidate_pretension_params
      pretension_params[:last_monthly_salary]      = clear_currency_param(candidate_pretension_params[:last_monthly_salary])     if pretension_params[:last_monthly_salary].present?
      pretension_params[:variable]                 = clear_currency_param(candidate_pretension_params[:variable])                if pretension_params[:variable].present?
      pretension_params[:last_salary_total]        = clear_currency_param(candidate_pretension_params[:last_salary_total])       if pretension_params[:last_salary_total].present?
      pretension_params[:total_pretended_from]     = clear_currency_param(candidate_pretension_params[:total_pretended_from])    if pretension_params[:total_pretended_from].present?
      pretension_params[:minimum_claim]            = clear_currency_param(candidate_pretension_params[:minimum_claim])           if pretension_params[:minimum_claim].present?
      pretension_params[:pretension_yearly_total]  = clear_currency_param(candidate_pretension_params[:pretension_yearly_total]) if pretension_params[:pretension_yearly_total].present?

      return pretension_params
    end

    def clear_currency_param(amount)
      amount.gsub('R$ ', '').gsub('.', '').gsub(',', '.')
    end
end
