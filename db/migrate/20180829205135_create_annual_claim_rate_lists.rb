class CreateAnnualClaimRateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :annual_claim_rate_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
