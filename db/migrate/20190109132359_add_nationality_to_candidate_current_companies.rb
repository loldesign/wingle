class AddNationalityToCandidateCurrentCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_current_companies, :nationality, :string
  end
end
