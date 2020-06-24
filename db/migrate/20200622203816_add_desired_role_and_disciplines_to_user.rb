class AddDesiredRoleAndDisciplinesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :desired_role, :string
    add_column :users, :desired_disciplines, :string
  end
end
