class AddColumnNeighborhoodsToCandidateInterests < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_interests, :neighborhoods, :integer, array:true, default: []
  end
end
