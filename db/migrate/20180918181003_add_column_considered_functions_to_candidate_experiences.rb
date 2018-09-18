class AddColumnConsideredFunctionsToCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
  	change_table :candidate_experiences do |t|
      t.integer :considered_functions, array:true, default: []
    end
  end
end
