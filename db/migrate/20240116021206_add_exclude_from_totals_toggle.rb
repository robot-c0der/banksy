class AddExcludeFromTotalsToggle < ActiveRecord::Migration[7.0]
  def change
    add_column :piggybanks, :exclude_from_totals, :boolean, default: false
  end
end
