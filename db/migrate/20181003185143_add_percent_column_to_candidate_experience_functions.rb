class AddPercentColumnToCandidateExperienceFunctions < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_experience_functions, :percentage, :integer
    remove_column :candidate_experience_functions, :years, :integer
    remove_column :candidate_experience_functions, :months, :integer
  end
end
