class CreateCandidateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_educations do |t|
      t.references :candidate, foreign_key: true
      t.integer :degree

      t.timestamps
    end
  end
end
