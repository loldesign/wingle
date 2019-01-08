class AddColumnSubsectorToCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_companies, :subsector, :integer
  end
end
