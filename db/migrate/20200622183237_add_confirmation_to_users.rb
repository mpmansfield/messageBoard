class AddConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :edu_email, :string, :unique => true
    add_column :users, :confirmation_code, :string, :unique => true
    add_column :users, :confirmed, :boolean
  end
end
