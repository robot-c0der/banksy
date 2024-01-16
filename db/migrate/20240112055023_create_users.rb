class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true, name: 'uniq_emails' }
      t.string :name, null: false
      t.string :password_digest, null: false
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
