class AddColumnsCitiesAndAreasToCandidateInterests < ActiveRecord::Migration[5.1]
  def change
  	change_table :candidate_interests do |t|
      t.integer :cities, array:true, default: []
      t.integer :areas, array:true, default: [] 
    end
  end
end