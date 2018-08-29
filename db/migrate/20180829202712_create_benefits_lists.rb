class CreateBenefitsLists < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
