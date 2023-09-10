class AddUniqueIndexToPiggybanks < ActiveRecord::Migration[7.0]
  def change
    add_index :piggybanks, [:user_id, :name], unique: true, name: 'user_goal_uniq_idx'
  end
end
