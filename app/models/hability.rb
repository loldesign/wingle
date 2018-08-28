class Hability < ApplicationRecord
	validates :name, :presence => true
	belongs_to :function
end
