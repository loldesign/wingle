class CreateLpsCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :lps_companies do |t|
      t.string :name
      t.string :cpf_cnpj
      t.string :locale
      t.string :region
      t.string :size
      t.string :mode
      t.string :port
      t.string :sector_key
      t.string :sector
      t.text :lps_key, array: true, default: []

      t.timestamps
    end
  end
end
