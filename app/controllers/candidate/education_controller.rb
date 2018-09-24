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
      @candidate_education.build_candidate_education_language
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
        candidate_education_language_params.each do |language_params|
          if language_params[:id].present? && language_params[:language_level_id].present?
            language = CandidateEducationLanguage.update(language_params[:id], language_params)
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
      @candidate_education_languages = @candidate_education.candidate_education_languages.empty? ? [CandidateEducationLanguage.new] : @candidate_education.candidate_education_languages
    end

    def candidate_education_params
      params.fetch(:candidate_education, {}).permit(:degree)
    end

    def candidate_education_language_params
      # params.fetch(:candidate_education_language, {}).permit(:language_id, :language_level_id)

      if params[:candidate_education_languages].present?
        params.fetch(:candidate_education_languages, {}).map do |p|
          p.permit(:id, :language_id, :language_level_id)
        end
      end
    end
end