class CreateHabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :habilities do |t|
      t.string :name

      t.timestamps
    end
  end
end
