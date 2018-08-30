class AddNicknameToSectors < ActiveRecord::Migration[5.1]
  change_table :sectors do |t|
    t.string :nickname
  end
end
