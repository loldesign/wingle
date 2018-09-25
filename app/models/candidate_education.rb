class CandidateEducation < ApplicationRecord
  belongs_to :candidate

  has_many :candidate_education_languages, dependent: :destroy
end
