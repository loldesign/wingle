class AddCodeToSectors < ActiveRecord::Migration[5.1]
  def change
  	add_column :sectors, :code, :string
  end
end
