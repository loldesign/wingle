class AddColumnsNameAndCellphoneToCandidates < ActiveRecord::Migration[5.1]
  def change
  	change_table :candidates do |t|
      t.string :name
      t.string :cellphone
    end
  end
end
