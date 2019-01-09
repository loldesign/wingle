class RemoveColumnMonthsFromCandidateExperienceTitles < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidate_experience_titles, :months, :integer
  end
end
