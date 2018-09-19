class CandidateCompany < ApplicationRecord
	belongs_to :candidate

	validates :name, presence: true
end
