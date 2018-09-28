class AddPriorityToRelevances < ActiveRecord::Migration[5.1]
  def change
    add_column :relevances, :priority, :integer
  end
end
