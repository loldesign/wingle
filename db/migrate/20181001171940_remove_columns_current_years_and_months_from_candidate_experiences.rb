class RemoveColumnsCurrentYearsAndMonthsFromCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	remove_column :candidate_experiences, :current_title_year, :integer
  	remove_column :candidate_experiences, :current_title_month, :integer
  end
end
