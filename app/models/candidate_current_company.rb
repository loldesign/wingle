class CandidateCurrentCompany < ApplicationRecord
	belongs_to :candidate

	validates :name, presence: true
end
