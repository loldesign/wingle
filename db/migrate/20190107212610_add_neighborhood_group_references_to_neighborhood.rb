class AddNeighborhoodGroupReferencesToNeighborhood < ActiveRecord::Migration[5.1]
  def change
  	add_reference :neighborhoods, :neighborhood_group
  end
end
