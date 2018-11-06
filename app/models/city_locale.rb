class CityLocale < ApplicationRecord
  belongs_to :city
  has_many :neighborhoods, dependent: :destroy
  validates :code, :uniqueness => true

  default_scope {order(priority: :asc)}
end
