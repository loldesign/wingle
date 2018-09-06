class AddCpfToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :cpf, :string
  end
end
