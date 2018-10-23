class AddCurrentlyWorkHereToCandidateCurrentCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidate_current_companies, :currently_work_here, :boolean, default: false
  end
end
