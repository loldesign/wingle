class Area < ApplicationRecord
	validates :name, :presence => true
	has_many :functions
end
