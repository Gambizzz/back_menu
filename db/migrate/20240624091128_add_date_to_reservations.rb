class AddDateToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :date, :date
  end
end
