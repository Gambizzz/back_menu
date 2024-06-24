class AddTimeToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :time, :time
  end
end
