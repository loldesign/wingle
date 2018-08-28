class CreateFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :functions do |t|
      t.string :name
      t.references :area
      t.timestamps
    end
  end
end
