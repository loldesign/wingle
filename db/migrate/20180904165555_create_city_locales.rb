class CreateCityLocales < ActiveRecord::Migration[5.1]
  def change
    create_table :city_locales do |t|
      t.string :name
      t.references :city
      t.timestamps
    end
  end
end
