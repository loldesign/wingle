class RemoveNicknameFromSectors < ActiveRecord::Migration[5.1]
  def change
    remove_column :sectors, :nickname, :string
  end
end
