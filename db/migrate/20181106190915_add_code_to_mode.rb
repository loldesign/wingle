class AddCodeToMode < ActiveRecord::Migration[5.1]
  def change
  	add_column :modes, :code, :string
  end
end
