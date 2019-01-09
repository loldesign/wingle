class ChangeColumnYearsToFloatOnCandidateExperienceTitles < ActiveRecord::Migration[5.1]
  def up
  	change_column :candidate_experience_titles, :years, :float
  end

  def down
  	change_column :candidate_experience_titles, :years, :integer
  end
end
