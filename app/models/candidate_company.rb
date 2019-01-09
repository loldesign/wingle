class CandidateCompany < ApplicationRecord
	extend Enumerize

	belongs_to :candidate

	validates :name, presence: true

	enumerize :nationality, in: [:national, :multinational]
end
