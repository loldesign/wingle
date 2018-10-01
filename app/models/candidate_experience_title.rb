class CandidateExperienceTitle < ApplicationRecord
  belongs_to :candidate_experience

  validates :title_id, presence: true
end
