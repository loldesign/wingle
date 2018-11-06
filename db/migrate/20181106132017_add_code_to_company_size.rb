class AddCodeToCompanySize < ActiveRecord::Migration[5.1]
  def change
  	add_column :company_sizes, :code, :string
  end
end
