class CreateCompanyAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :company_abouts do |t|
    	t.references :candidate, foreign_key: true
    	t.bigint :company_size_id
    	t.bigint :mode_id
    	t.integer :sectors, array:true, default: []
    	t.integer :neighborhoods, array:true, default: []

      t.timestamps
    end
  end
end
