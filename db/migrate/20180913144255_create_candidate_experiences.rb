class CreateCandidateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_experiences do |t|
    	t.references :candidate
      t.integer :current_title
      t.integer :areas, array:true, default: []
      t.integer :functions, array:true, default: []
      t.integer :disconsidered_functions, array:true, default: []

      t.timestamps
    end
  end
end
