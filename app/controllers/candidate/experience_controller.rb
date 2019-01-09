class Candidate::ExperienceController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :sixth, :seventh, :complete, :transition]
  before_action :set_years_and_months, only: [:second, :fifth]
  before_action :set_header_options, only: [:first, :second, :third, :fourth, :fifth, :sixth, :seventh]

  def transition
    @header_options = {style: :only_logo}
  end

  def first
    @title_list = TitleList.order(priority: :asc)
  end

  def second
    if @candidate_experience.nil?
      CandidateManager.new(candidate: @candidate).create_candidate_experience
      @candidate_experience = @candidate.candidate_experience
    end

    if params_present
      if @candidate_experience.update_attributes(candidate_experience_params)
        @candidate_experience.title_experiences = [] unless @candidate_experience.title_experiences.present?
        @candidate_experience.save
      else
        render action: :first
      end
    end

    if @candidate_experience.current_title.nil?
      redirect_to action: :first
    else
      current_title = TitleList.find(@candidate_experience.current_title)
      @titles = TitleList.where("priority <= ?", current_title.priority).order(priority: :asc)
    end
  end

  def third
    if params_present && !create_candidate_experience_titles
      render action: :second
    end

    @area = Area.all
  end

  def fourth
    if params_present_but_not_updated
      render action: :third
    end

    if @candidate_experience.areas.nil? || @candidate_experience.areas == []
      redirect_to action: :third
    else

      @function = Function.by_areas(@candidate_experience.areas)
      @areas    = @candidate_experience.list_areas
    end
  end

  def fifth
    if params_present_but_not_updated
      render action: :fourth
    end

    if @candidate_experience.functions.nil? || @candidate_experience.functions == []
      redirect_to action: :fourth
    else
      @array_list = Array.new(10)
      i = 10
      10.times do |index|
        @array_list[index] = ["#{i}%", i]
        i = i + 10
      end

      @function = Function.by_ids_list(@candidate_experience.functions)
    end
  end

  def sixth
    if params_present && !create_candidate_experience_function
      render action: :fifth
    end

    if @candidate_experience.areas.nil? || @candidate_experience.areas == []
      redirect_to action: :third
    else
      disconsidered_functions  = Function.by_ids_list(@candidate_experience.disconsidered_functions)
      experience_functions     = Function.by_ids_list(@candidate_experience.functions)
      all_functions            = Function.by_areas(@candidate_experience.areas)

      @function = all_functions - experience_functions - disconsidered_functions
      @areas    = @candidate_experience.list_areas
    end
  end

  def complete
    if params_present_but_not_updated
      render action: :seventh
    end

    @candidate.completed_experiences! if @candidate.reload.experience?

    redirect_to candidate_home_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_experience = @candidate.candidate_experience
    end

    def candidate_experience_params
      params.fetch(:candidate_experience, {}).permit(:current_title, :others_percentage, areas: [], functions: [], disconsidered_functions: [], considered_functions: [],
        candidate_experience_function: [:function_id, :percentage], candidate_experience_titles: [:title_id, :years, :months])
    end

    def create_candidate_experience_function
      CandidateManager.new(candidate_experience: @candidate_experience, candidate_experience_params: candidate_experience_params)
                      .create_candidate_experience_function
    end

    def create_candidate_experience_titles
      CandidateManager.new(candidate_experience: @candidate_experience, candidate_experience_params: candidate_experience_params)
                      .create_candidate_experience_titles
    end

    def params_present_but_not_updated
      params_present && !@candidate_experience.update_attributes(candidate_experience_params)
    end

    def params_present
      candidate_experience_params.present?
    end

    def set_years_and_months
      manager = CandidateManager.new
      @years  = manager.optionsForSelectYear
      @months = manager.optionsForSelectMonth
    end

    def set_header_options
      @header_options = {style: :with_logo_back_button}
    end
end