class AddMostRecentTransactionToPiggybank < ActiveRecord::Migration[7.1]
  def change
    add_column :piggybanks, :most_recent_transaction, :decimal, precision: 15, scale: 3, null: true, default: 0
  end
end
