class CreateTermAccepts < ActiveRecord::Migration[5.1]
  def change
    create_table :term_accepts do |t|
      t.references :acceptable, polymorphic: true, index: true
      t.references :term, index: true
      t.boolean    :accepted, default: true
      t.timestamps
    end
  end
end
