class CreateSubsectors < ActiveRecord::Migration[5.1]
  def change
    create_table :subsectors do |t|
    	t.string     :name
    	t.references :sector
      t.timestamps
    end
  end
end
