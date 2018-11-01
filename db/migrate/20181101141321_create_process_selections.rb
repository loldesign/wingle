class CreateProcessSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :process_selections do |t|
      t.references :company
      t.references :owner, polymorphic: true, index: true
      t.string :state
      t.timestamps
    end
  end
end
