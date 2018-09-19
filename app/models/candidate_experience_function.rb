class CandidateExperienceFunction < ApplicationRecord
	belongs_to :candidate_experience

	validates :function_id, presence: true
end
