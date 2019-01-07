class CreateNeighborhoodGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhood_groups do |t|
    	t.string :name
      t.references :city
      t.references :city_locale
    	t.string :code

      t.timestamps
    end
  end
end
