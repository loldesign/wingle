class AddCandidateAvatarToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :candidate_avatar, :string
  end
end
