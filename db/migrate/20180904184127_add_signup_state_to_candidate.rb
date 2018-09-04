class AddSignupStateToCandidate < ActiveRecord::Migration[5.1]
  def change
    change_table :candidates do |t|
      t.string :signup_state
    end
  end
end
