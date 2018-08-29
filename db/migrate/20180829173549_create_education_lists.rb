class CreateEducationLists < ActiveRecord::Migration[5.1]
  def change
    create_table :education_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
