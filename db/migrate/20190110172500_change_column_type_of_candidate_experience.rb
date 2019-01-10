class ChangeColumnTypeOfCandidateExperience < ActiveRecord::Migration[5.1]
  def change
    change_column :candidate_experiences, :last_function, 'integer USING CAST(last_function AS integer)'
  end
end
