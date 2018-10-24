class Candidate::PretensionController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :complete]

  def first
    @salary_list = NofsalariesList.all
    @claim = AnnualClaimRateList.all
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

  def third
    # @claim = AnnualClaimRateList.all
    # rounded = @candidate_pretension.last_salary_total.present? ? (@candidate_pretension.last_salary_total/1000).ceil : 0
    # @last_salary_total = rounded * 1000
    # @selected = @candidate_pretension.pretension_minimum_percent.present? ? @candidate_pretension.pretension_minimum_percent : false
    # if params_present_but_not_updated
    #   render action: :second
    # end
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
      pretension_params[:last_monthly_salary] = candidate_pretension_params[:last_monthly_salary].gsub('R$ ', '').gsub('.', '').gsub(',', '.')  if pretension_params[:last_monthly_salary].present?
      pretension_params[:variable]            = candidate_pretension_params[:variable].gsub('R$ ', '').gsub('.', '').gsub(',', '.')  if pretension_params[:variable].present?
      pretension_params[:last_salary_total]   = candidate_pretension_params[:last_salary_total].gsub('R$ ', '').gsub('.', '').gsub(',', '.') if pretension_params[:last_salary_total].present?
      pretension_params[:minimum_claim]       = candidate_pretension_params[:minimum_claim].gsub('R$ ', '').gsub('.', '').gsub(',', '.') if pretension_params[:minimum_claim].present?
      pretension_params[:pretension_yearly_total]  = candidate_pretension_params[:pretension_yearly_total].gsub('R$ ', '').gsub('.', '').gsub(',', '.') if pretension_params[:pretension_yearly_total].present?
      return pretension_params
    end
end