class AddAssignedToDisciplineRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :discipline_requests, :assigned, :boolean
  end
end
