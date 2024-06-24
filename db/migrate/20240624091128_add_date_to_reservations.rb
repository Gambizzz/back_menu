class AddDateToReservations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :date)
      add_column :reservations, :date, :date
    end
  end
end
