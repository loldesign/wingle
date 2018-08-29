class CreateLanguageLists < ActiveRecord::Migration[5.1]
  def change
    create_table :language_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
