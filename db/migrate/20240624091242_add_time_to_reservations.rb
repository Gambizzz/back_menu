class AddTimeToReservations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :time)
      add_column :reservations, :time, :time
    end
  end
end
