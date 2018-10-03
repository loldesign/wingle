class RenameColumnNeighborhodFromCandidateCurrentCompany < ActiveRecord::Migration[5.1]
  def change
    rename_column :candidate_current_companies, :neighborhod, :neighborhood
  end
end
