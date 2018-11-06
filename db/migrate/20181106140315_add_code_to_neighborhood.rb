class AddCodeToNeighborhood < ActiveRecord::Migration[5.1]
  def change
  	add_column :neighborhoods, :code, :string
  end
end
