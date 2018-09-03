class AddScoreToCompanySize < ActiveRecord::Migration[5.1]
  def change
    add_column :company_sizes, :score, :decimal
  end
end
