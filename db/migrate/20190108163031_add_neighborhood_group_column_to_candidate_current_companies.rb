class AddNeighborhoodGroupColumnToCandidateCurrentCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_current_companies, :neighborhood_group, :string
  end
end
