class CreateRangeLists < ActiveRecord::Migration[5.1]
  def change
    create_table :range_lists do |t|
      t.string :name
      t.timestamps
    end
  end
end
