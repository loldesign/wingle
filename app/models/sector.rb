class Sector < ApplicationRecord
	validates :name, :presence => true
	validates :code, :uniqueness => true
	has_many :subsectors, dependent: :destroy
end
