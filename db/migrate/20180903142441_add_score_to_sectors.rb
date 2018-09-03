class AddScoreToSectors < ActiveRecord::Migration[5.1]
  def change
    add_column :sectors, :score, :decimal
  end
end
