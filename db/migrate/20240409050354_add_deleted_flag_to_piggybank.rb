class AddDeletedFlagToPiggybank < ActiveRecord::Migration[7.1]
  def change
    add_column :piggybanks, :deleted, :boolean, default: false
  end
end
