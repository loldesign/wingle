class CityLocale < ApplicationRecord
  belongs_to :city
  has_many :neighborhoods, dependent: :destroy
end
