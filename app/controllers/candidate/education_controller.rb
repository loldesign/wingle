class Candidate::EducationController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate, only: [:first, :second, :complete]
  before_action :set_candidate_languages, only: [:second, :complete]

  def first
    @education_list = EducationList.all
  end

  def second
    if @candidate_education.nil?
      @candidate.build_candidate_education
      @candidate_education = @candidate.candidate_education
      @candidate_education.save
    end

    if candidate_education_params.present? && !@candidate_education.update_attributes(candidate_education_params)
      render action: :first
    end

    @language = LanguageList.all
    @language_level = LanguageLevelList.all
  end

  def complete
    if candidate_education_language_params.present?
      CandidateEducationLanguage.transaction do
        candidate_education_language_params.each do |index, language_params|
          # check if already exists to avoid duplicate
          if language_params[:id].present? && language_params[:language_level_id].present?
            language = CandidateEducationLanguage.update(language_params[:id], language_params)
          # if just id is present, it probably have been deleted
          elsif language_params[:id].present? && language_params[:language_level_id].nil?
            language = CandidateEducationLanguage.destroy(language_params[:id])
          else
            language = CandidateEducationLanguage.new(language_params)
            @candidate_education.candidate_education_languages << language
          end
          if !language.save
            raise ActiveRecord::Rollback
            render action: :second
          end
        end
      end
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