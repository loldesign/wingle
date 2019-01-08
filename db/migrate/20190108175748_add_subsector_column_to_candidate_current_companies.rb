class AddSubsectorColumnToCandidateCurrentCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_current_companies, :subsector, :string
  end
end
