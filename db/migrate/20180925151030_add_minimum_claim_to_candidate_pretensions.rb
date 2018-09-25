class AddMinimumClaimToCandidatePretensions < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_pretensions, :minimum_claim, :integer
    rename_column :candidate_pretensions, :pretension_minimum, :pretension_minimum_percent
  end
end
