class Country < ApplicationRecord
  has_many :country_locales, dependent: :destroy
  has_many :states, dependent: :destroy
end