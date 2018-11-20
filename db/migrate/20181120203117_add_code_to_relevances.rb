class AddCodeToRelevances < ActiveRecord::Migration[5.1]
  def change
      change_table :relevances do |t|
        t.string :code
      end
  end
end
