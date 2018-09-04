class CreateCountryLocales < ActiveRecord::Migration[5.1]
  def change
    create_table :country_locales do |t|
      t.string :name
      t.references :country
      t.timestamps
    end
  end
end
