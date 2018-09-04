class AddFieldsToNeighborhood < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :name, :string
    add_reference :neighborhoods, :city
  end
end
