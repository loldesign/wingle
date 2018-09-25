class AddColumnValueToAnnualClaimRateLists < ActiveRecord::Migration[5.1]
  def change
    add_column :annual_claim_rate_lists, :value, :decimal
  end
end
