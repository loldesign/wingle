class CreateCandidateHabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_habilities do |t|
    	t.references :candidate
    	t.integer :areas, array:true, default: []

      t.timestamps
    end
  end
end
