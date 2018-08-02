class CreateLocales < ActiveRecord::Migration[5.1]
  def change
    create_table :locales do |t|
      t.references :city
      t.string :name
      t.timestamps
    end
    add_index :locales, :name, unique: true
  end
end
