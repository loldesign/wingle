class AddPriorityToTitleList < ActiveRecord::Migration[5.1]
  def change
    add_column :title_lists, :priority, :integer
  end
end
