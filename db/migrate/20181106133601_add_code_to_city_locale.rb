class AddCodeToCityLocale < ActiveRecord::Migration[5.1]
  def change
  	add_column :city_locales, :code, :string
  end
end
