class AddPriorityToCityLocale < ActiveRecord::Migration[5.1]
  def change
    add_column :city_locales, :priority, :integer, default: 1000
  end
end
