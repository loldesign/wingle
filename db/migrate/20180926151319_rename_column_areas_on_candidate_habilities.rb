class RenameColumnAreasOnCandidateHabilities < ActiveRecord::Migration[5.1]
  def change
  	rename_column :candidate_habilities, :areas, :functions
  end
end
