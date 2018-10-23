class AddDatesColumnToCandidateCurrentCompanies < ActiveRecord::Migration[5.1]
  def change
    change_table :candidate_current_companies, :bulk => true do |t|
      t.integer :start_date_month
      t.integer :start_date_year
      t.integer :end_date_month
      t.integer :end_date_year
    end
  end
end
