class AddColumnsStartDateAndEndDateToCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidate_companies, :start_date, :date
  	add_column :candidate_companies, :end_date, :date
  end
end
