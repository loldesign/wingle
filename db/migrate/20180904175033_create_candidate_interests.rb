class CreateCandidateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_interests do |t|
      t.references :candidate
      t.integer :locales, array:true, default: []
      t.integer :company_sizes, array:true, default: []
      t.integer :modes, array:true, default: []
      t.integer :sectors, array:true, default: []
      t.integer :relevances, array:true, default: []

      t.timestamps
    end
  end
end
