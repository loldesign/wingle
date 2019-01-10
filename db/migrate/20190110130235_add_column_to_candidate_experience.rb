class AddColumnToCandidateExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :candidate_experiences, :last_function, :string    
  end
end
