class AddScoreToMode < ActiveRecord::Migration[5.1]
  def change
    add_column :modes, :score, :decimal
  end
end
