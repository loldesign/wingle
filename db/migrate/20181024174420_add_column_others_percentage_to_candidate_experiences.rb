class AddColumnOthersPercentageToCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidate_experiences, :others_percentage, :integer
  end
end
