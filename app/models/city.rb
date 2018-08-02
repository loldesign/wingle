class City < ApplicationRecord
  has_many :locales, dependent: :destroy
  belongs_to :state
end