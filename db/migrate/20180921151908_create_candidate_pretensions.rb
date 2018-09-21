class CreateCandidatePretensions < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_pretensions do |t|
      t.references :candidate
      t.decimal :last_monthly_salary, :precision => 8, :scale => 2
      t.integer :nofsalaries
      t.decimal :variable, :precision => 8, :scale => 2
      t.decimal :last_salary_total, :precision => 8, :scale => 2
			t.decimal :pretension_yearly, :precision => 8, :scale => 2
			t.decimal :pretension_minimum, :precision => 8, :scale => 2
			t.decimal :pretension_yearly_total, :precision => 8, :scale => 2
      t.integer :benefits, array:true, default: []

      t.timestamps
    end
  end
end
