class CreateCandidateProcessSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_process_selections do |t|
      t.references :process_selection
      t.references :candidate
      t.string :state
      t.timestamps
    end
  end
end
