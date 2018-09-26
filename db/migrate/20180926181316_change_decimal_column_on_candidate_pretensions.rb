class ChangeDecimalColumnOnCandidatePretensions < ActiveRecord::Migration[5.1]
  def change
    change_column :candidate_pretensions, :last_monthly_salary, :decimal, :precision => 15, :scale => 2
    change_column :candidate_pretensions, :last_salary_total, :decimal, :precision => 15, :scale => 2
    change_column :candidate_pretensions, :pretension_yearly_total, :decimal, :precision => 15, :scale => 2
    change_column :candidate_pretensions, :variable, :decimal, :precision => 15, :scale => 2
    change_column :candidate_pretensions, :pretension_minimum_percent, :decimal
  end
end
