class AddNewChallengesEmployeedOptionAndCoorporateMailToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :new_challenges, :boolean, default: false
    add_column :candidates, :employed, :boolean, default: false
    add_column :candidates, :corporate_email, :string
  end
end
