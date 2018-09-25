class AnnualClaimRateList < ApplicationRecord
	validates :name, :value, presence: true
end
