class Candidate::ExperienceController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :third, :fourth, :fifth, :complete]

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

    @title_list = TitleList.all
  end

  def third
    if candidate_experience_params.present? && !@candidate_experience.update_attributes(candidate_experience_params)
      render action: :second
    end

    @header_options = {style: :with_logo_back_button}

    @area = Area.all
  end

  def fourth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def fifth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def sixth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def seventh
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_experience = @candidate.candidate_experience
    end

    def candidate_experience_params
      params.fetch(:candidate_experience, {}).permit(:current_title, :current_title_year, :current_title_month)
    end
end