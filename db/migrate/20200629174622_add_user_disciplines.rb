class AddUserDisciplines < ActiveRecord::Migration[6.0]
  def up
    create_table :user_disciplines do |t|
      t.belongs_to :user, index: true
      t.belongs_to :discipline, index: true
    end
  end

  def down
    drop_table :user_disciplines
  end
end
