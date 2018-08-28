class Function < ApplicationRecord
	validates :name, :presence => true
	belongs_to :area
	has_many :habilities
end
