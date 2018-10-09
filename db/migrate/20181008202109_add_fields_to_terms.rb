class AddFieldsToTerms < ActiveRecord::Migration[5.1]
  def change
    change_table :terms do |t|
      t.string :state
      t.string :for
      t.references :parent
    end
  end
end
