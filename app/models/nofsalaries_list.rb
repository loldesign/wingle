class NofsalariesList < ApplicationRecord
	validates_numericality_of :value, greater_than_or_equal_to: 0
end
