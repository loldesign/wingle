class CandidateExperience < ApplicationRecord
  belongs_to :candidate
  has_many   :functions_time_period, foreign_key: "candidate_experience_id", class_name: "CandidateExperienceFunction", dependent: :destroy
  has_many   :title_experiences,     foreign_key: "candidate_experience_id", class_name: "CandidateExperienceTitle"   , dependent: :destroy
end