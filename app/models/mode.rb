class Mode < ApplicationRecord
	validates :name, :presence => true
	validates :code, :uniqueness => true
end
