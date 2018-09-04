class City < ApplicationRecord
  has_many :locales, dependent: :destroy
  has_many :neighborhoods
  belongs_to :state
end