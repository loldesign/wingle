class AddColumnFunctionsTimeExpToCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	change_table :candidate_experiences do |t|
      t.text :functions_time_exp
    end
  end
end
