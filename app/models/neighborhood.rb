class Neighborhood < ApplicationRecord
  belongs_to :city
  belongs_to :city_locale
end
