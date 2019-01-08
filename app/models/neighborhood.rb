class Neighborhood < ApplicationRecord
  belongs_to :city
  belongs_to :city_locale
  belongs_to :neighborhood_group
end
