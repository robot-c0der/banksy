class RenameUncomfirmedEmailColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :uncomfirmed_email, :unconfirmed_email
  end
end
