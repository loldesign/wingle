class AddCorrectNicknameToSectors < ActiveRecord::Migration[5.1]
  def change
    add_column :sectors, :nickname, :string
  end
end
