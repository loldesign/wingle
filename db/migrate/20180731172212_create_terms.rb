class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.string :title
      t.text :term
      t.timestamps
    end
  end
end
