class CreateCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_companies do |t|
    	t.references :candidate
    	t.string :name
    	t.integer :years
    	t.integer :months
    	t.integer :size
    	t.integer :sector
    	t.integer :title

      t.timestamps
    end
  end
end
