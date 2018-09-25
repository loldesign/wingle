class Candidate::ExperienceController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :sixth, :seventh, :complete]
  before_action :set_years_and_months, only: [:second, :fifth]

  def first
    @header_options = {style: :with_logo_back_button}

    @title_list = TitleList.all
  end

  def second
    if @candidate_experience.nil?
      @candidate.build_candidate_experience
      @candidate_experience = @candidate.candidate_experience
      @candidate_experience.save
    end

    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :first
    end

    @header_options = {style: :with_logo_back_button}

    if @candidate_experience.current_title.nil?
      redirect_to action: :first
    else

      @title = TitleList.find(@candidate_experience.current_title)
    end
  end

  def third
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :second
    end

    @header_options = {style: :with_logo_back_button}

    @area = Area.all
  end

  def fourth
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :third
    end

    @header_options = {style: :with_logo_back_button}

    if @candidate_experience.areas.nil? || @candidate_experience.areas == []
      redirect_to action: :third
    else

      @function = Function.by_areas(@candidate_experience.areas)
    end
  end

  def fifth
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :fourth
    end

    @header_options = {style: :with_logo_back_button}

    if @candidate_experience.functions.nil? || @candidate_experience.functions == []
      redirect_to action: :fourth
    else

      @function = Function.where("id IN (?)", @candidate_experience.functions)
    end
  end

  def sixth
    if candidate_experience_params.present? && !create_candidate_experience_function
      render action: :fifth
    end

    @header_options = {style: :with_logo_back_button}

    if @candidate_experience.areas.nil? || @candidate_experience.areas == []
      redirect_to action: :third
    else

      @function = Function.where("id IN (?)", @candidate_experience.functions)
    end
  end

  def seventh
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :sixth
    end

    @header_options = {style: :with_logo_back_button}

    if @candidate_experience.areas.nil? || @candidate_experience.areas == []
      redirect_to action: :third
    else

      @disconsidered_functions = Function.where("id IN (?)", @candidate_experience.disconsidered_functions)
      @function = Function.by_areas(@candidate_experience.areas) - @disconsidered_functions
    end
  end

  def complete
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
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
      params.fetch(:candidate_experience, {}).permit(:current_title, :current_title_year, :current_title_month,
          areas: [], functions: [], disconsidered_functions: [], considered_functions: [], candidate_experience_function: [:function_id, :years, :months])
    end

    def create_candidate_experience_function
      exp_functions = candidate_experience_params[:candidate_experience_function]

      exp_functions.each do |function|
        # verify to avoid duplicate
        if @candidate_experience.functions_time_period.present? && @candidate_experience.functions_time_period.find_by_function_id(function[:function_id]).present?
          exp_function = CandidateExperienceFunction.find_by_function_id(function[:function_id])
          exp_function.update_attributes(function)
        else
          exp_function = CandidateExperienceFunction.new(function)
          @candidate_experience.functions_time_period << exp_function
        end
      end

      return @candidate_experience.save
    end

    def set_years_and_months
      # divide if we need more than 11 years
      @years = []
      @months = []
      for i in 0..11
        if i == 1
          @years << ["#{i} ANO", "#{i}"]
          @months << ["#{i} MÊS", "#{i}"]
        else
          @years << ["#{i} ANOS", "#{i}"]
          @months << ["#{i} MESES", "#{i}"]
        end
      end
    end
end