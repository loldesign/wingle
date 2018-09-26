class AddCandidateCurriculumToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :candidate_curriculum, :string
  end
end
