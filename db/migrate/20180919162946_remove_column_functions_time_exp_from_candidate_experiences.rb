class RemoveColumnFunctionsTimeExpFromCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	remove_column :candidate_experiences, :functions_time_exp, :text
  end
end
