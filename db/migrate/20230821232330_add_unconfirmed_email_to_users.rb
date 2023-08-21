class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uncomfirmed_email, :string
  end
end
