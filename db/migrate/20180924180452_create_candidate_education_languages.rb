class CreateCandidateEducationLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_education_languages do |t|
    	t.references :candidate_education
    	t.bigint :language_id
    	t.bigint :language_level_id

      t.timestamps
    end
  end
end
