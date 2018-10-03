class RemoveColumnCorporateMailFromCandidates < ActiveRecord::Migration[5.1]
  def change
  	remove_column :candidates, :corporate_email, :string
  end
end
