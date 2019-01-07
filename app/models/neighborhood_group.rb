class NeighborhoodGroup < ApplicationRecord
	belongs_to :city
  belongs_to :city_locale
  has_many :neighborhoods, dependent: :destroy
  validates :code, :uniqueness => true
end
