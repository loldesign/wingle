class CandidateExperience < ApplicationRecord
  belongs_to :candidate
  has_many   :candidate_experience_functions, dependent: :destroy
  has_many   :title_experiences,     foreign_key: "candidate_experience_id", class_name: "CandidateExperienceTitle"   , dependent: :destroy

  def list_areas
    Area.where(id: self.areas)
  end
end