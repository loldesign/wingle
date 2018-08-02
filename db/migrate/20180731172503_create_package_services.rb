class CreatePackageServices < ActiveRecord::Migration[5.1]
  def change
    create_table :package_services do |t|
      t.string :package_title
      t.text :description
      t.boolean :signature
      t.decimal :value
      t.timestamps
    end
  end
end
