class CityLocale < ApplicationRecord
  belongs_to :city
  has_many :neighborhood_groups, dependent: :destroy
  has_many :neighborhoods
  validates :code, :uniqueness => true

  default_scope {order(priority: :asc)}
end
