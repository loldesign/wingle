class CreateCandidateCurrentCompany < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_current_companies do |t|
    	t.references :candidate, foreign_key: true
    	t.string :name
    	t.date 	 :start_date
    	t.date 	 :end_date
    	t.string :company_size
    	t.string :sector
    	t.string :mode
    	t.string :city
    	t.string :city_locale
    	t.string :neighborhod
    	t.string :corporate_email

    	t.timestamps
    end
  end
end
