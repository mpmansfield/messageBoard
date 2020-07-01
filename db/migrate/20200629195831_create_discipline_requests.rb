class CreateDisciplineRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :discipline_requests do |t|
      t.integer :user_id
      t.integer :discipline_id

      t.timestamps
    end
  end
end
