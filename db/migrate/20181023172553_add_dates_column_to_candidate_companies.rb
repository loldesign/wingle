class AddDatesColumnToCandidateCompanies < ActiveRecord::Migration[5.1]
  def change
  	change_table :candidate_companies, :bulk => true do |t|
      t.integer :start_date_month
      t.integer :start_date_year
      t.integer :end_date_month
      t.integer :end_date_year
      t.remove :years
      t.remove :start_date
      t.remove :end_date
    end
  end
end
