class AddFieldsToCandidatePretension < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_pretensions, :bonus_or_plr, :decimal
    add_column :candidate_pretensions, :total_pretended_from, :decimal, :precision => 8, :scale => 2
  end
end
