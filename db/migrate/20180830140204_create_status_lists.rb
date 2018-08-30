class CreateStatusLists < ActiveRecord::Migration[5.1]
  def change
    create_table :status_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
