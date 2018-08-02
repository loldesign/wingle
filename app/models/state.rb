class State < ApplicationRecord
  has_many :cities, dependent: :destroy
  belongs_to :country
end