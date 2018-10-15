class CityLocale < ApplicationRecord
  belongs_to :city
  has_many :neighborhoods, dependent: :destroy

  default_scope {order(priority: :asc)}
end
