class CreatePiggybanks < ActiveRecord::Migration[7.0]
  def change
    create_table :piggybanks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :current_amount, null: false, default: 0.00, precision: 15, scale: 3
      t.decimal :goal_amount, null: false, precision: 15, scale: 3

      t.timestamps
    end
  end
end
