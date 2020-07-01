class AddDisciplines < ActiveRecord::Migration[6.0]
  def up
    create_table :disciplines do |t|
      t.string :title
      t.timestamps
      t.timestamp :deleted_at
    end
  end

  def down
    drop_table :disciplines
  end
end

