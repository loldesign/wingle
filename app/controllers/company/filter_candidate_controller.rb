class Company::FilterCandidateController < ApplicationController
  before_action :history_process_selection, only: [:first]
  before_action :load_process_selection
  before_action :update_process_selection, only: [:second, :third, :fourth, :fith]

  def first
    @area = Area.all
  end

  def second
    @function = Function.where(area_id: @process_selection.area_id)
  end

  def third
    @title_list = TitleList.order(priority: :asc)
  end

  def fourth
    @education_list = EducationList.all
    @language       = LanguageList.all
  end

  def fith
    @process_selection.start! if @process_selection.setting?

    redirect_to company_candidate_profile_path
  end

  private
  def history_process_selection
    process_selection = ProcessSelectionManager::List.new(owner: current_company).active

    process_selection.history! if process_selection.started?
  end

  def load_process_selection
    @process_selection = ProcessSelectionManager::List.new(owner: current_company).active
  end

  def process_selection_params
    params.require(:process_selection).permit(:area_id, :function_id, :title_list_id, :min_time_function, :min_time_title, :min_anual_salary, :max_anual_salary, :education_list_id, :language_list_id, :prior_experience)
  end

  def update_process_selection
    @process_selection.update_attributes(process_selection_params) if params[:process_selection].present?
  end
end
