class CreateCandidateExperienceTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_experience_titles do |t|
    	t.references :candidate_experience
      t.integer :title_id
      t.integer :years
      t.integer :months

      t.timestamps
    end
  end
end
