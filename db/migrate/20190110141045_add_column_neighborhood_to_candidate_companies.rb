class AddColumnNeighborhoodToCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_companies, :neighborhood,       :integer
    add_column :candidate_companies, :neighborhood_group, :integer
  end
end
