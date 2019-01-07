class City < ApplicationRecord
  has_many :city_locales, dependent: :destroy
  has_many :neighborhoods, dependent: :destroy
  has_many :neighborhood_groups, dependent: :destroy
  belongs_to :state
end