class AddPriorExperienceToProcessSelection < ActiveRecord::Migration[5.1]
  def change
    change_table :process_selections do |t|
      t.integer :prior_experience
    end
  end
end
