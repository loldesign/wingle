class CandidateEducationLanguage < ApplicationRecord
	belongs_to :candidate_education
  belongs_to :language, foreign_key: :language_id, class_name: 'LanguageList'
end
