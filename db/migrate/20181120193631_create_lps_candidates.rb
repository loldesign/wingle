class CreateLpsCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :lps_candidates do |t|
      t.string :name
      t.string :cpf
      t.string :locale
      t.string :region
      t.string :size
      t.string :mode
      t.string :port
      t.string :sector_key
      t.string :sector
      t.string :relevance
      t.text :lps_key, array: true, default: []
      t.timestamps
    end
  end
end
