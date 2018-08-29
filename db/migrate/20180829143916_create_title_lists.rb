class CreateTitleLists < ActiveRecord::Migration[5.1]
  def change
    create_table :title_lists do |t|
      t.string :name
      t.timestamps
    end
  end
end
