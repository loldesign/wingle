class AddTotalFunctionsPercentageColumnToCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidate_experiences, :total_functions_percentage, :integer, default: 0
  end
end
