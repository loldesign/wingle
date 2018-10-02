class RenameColumnFunctionsToHabilitiesOnCandidateHabilities < ActiveRecord::Migration[5.1]
  def change
  	rename_column :candidate_habilities, :functions, :habilities
  end
end
