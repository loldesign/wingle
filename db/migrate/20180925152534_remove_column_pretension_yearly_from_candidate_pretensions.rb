class RemoveColumnPretensionYearlyFromCandidatePretensions < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidate_pretensions, :pretension_yearly, :decimal
  end
end
