class AddCityLocaleReferencesToNeighborhoods < ActiveRecord::Migration[5.1]
  def change
  	add_reference :neighborhoods, :city_locale
  end
end
