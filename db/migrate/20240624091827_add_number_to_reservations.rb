class AddNumberToReservations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :number)
      add_column :reservations, :number, :string
    end
  end
end
