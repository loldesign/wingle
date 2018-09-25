class AddColumnValueToNofsalaries < ActiveRecord::Migration[5.1]
  def change
  	add_column :nofsalaries_lists, :value, :decimal
  end
end
