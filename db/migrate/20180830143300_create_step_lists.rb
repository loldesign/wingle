class CreateStepLists < ActiveRecord::Migration[5.1]
  def change
    create_table :step_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
