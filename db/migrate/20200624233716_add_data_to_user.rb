class AddDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :organization, :string
    add_column :users, :title, :string
    add_column :users, :assigned, :boolean
  end
end
