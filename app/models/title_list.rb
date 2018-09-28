class TitleList < ApplicationRecord
	validates :name, :presence => true
  validates :priority, uniqueness: true
end
