class CreateLpsMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :lps_matches do |t|
      t.string  :cpf_candidate
      t.string  :cpf_cnpj_company
      t.string  :relevance
      t.decimal :locale_score
      t.decimal :port_score
      t.decimal :sector_score
      t.decimal :score
      t.string  :lps_company_key
      t.string  :lps_candidate_key
      t.timestamps
    end
  end
end
