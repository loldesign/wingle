class AddColumnCnpjToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :cpf_cnpj, :string
  end
end
