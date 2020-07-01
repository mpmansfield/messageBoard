class AddDisciplineToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :discipline, null: false, foreign_key: true
  end
end
