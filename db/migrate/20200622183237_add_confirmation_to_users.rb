class AddConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :edu_email, :string, :unique => true
  end
end
