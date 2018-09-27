class Candidate::EducationController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :complete]
  before_action :set_candidate_languages, only: [:second, :complete]

  def first
    @education_list = EducationList.all
  end

  def second
    if @candidate_education.nil?
      CandidateManager.new(candidate: @candidate).create_candidate_education
      @candidate_education = @candidate.candidate_education
    end

    if candidate_education_params.present? && !@candidate_education.update_attributes(candidate_education_params)
      render action: :first
    end

    @language = LanguageList.all
    @language_level = LanguageLevelList.all
  end

  def complete
    manager = CandidateManager.new(candidate_education_language_params: candidate_education_language_params, candidate_education: @candidate_education)
    saved = manager.create_or_update_candidate_education_language
    if !saved
      render action: :second
    end

    @candidate.completed_education! if @candidate.reload.education?

    redirect_to candidate_pretension_step_1_path
  end

  private
    def set_candidate
      @candidate = current_candidate
      @candidate_education = @candidate.candidate_education
    end

    def set_candidate_languages
      if @candidate_education.present?
        @candidate_education_languages = @candidate_education.candidate_education_languages.empty? ? [CandidateEducationLanguage.new] : @candidate_education.candidate_education_languages
      else
        @candidate_education_languages = [CandidateEducationLanguage.new]
      end
    end

    def candidate_education_params
      params.fetch(:candidate_education, {}).permit(:degree)
    end

    def candidate_education_language_params
      params.permit(candidate_education_languages: {})[:candidate_education_languages]
    end
end