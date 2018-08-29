class CreateLanguageLevelLists < ActiveRecord::Migration[5.1]
  def change
    create_table :language_level_lists do |t|
      t.text :name

      t.timestamps
    end
  end
end
