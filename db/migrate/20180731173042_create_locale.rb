class CreateLocale < ActiveRecord::Migration[5.1]
  def change
    create_table :locales do |t|
      t.string :country
      t.string :state
      t.string :state_region
      t.string :city
      t.string :city_region
    end
  end
end
