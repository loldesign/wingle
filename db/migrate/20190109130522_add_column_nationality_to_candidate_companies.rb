class AddColumnNationalityToCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_companies, :nationality, :string
  end
end
