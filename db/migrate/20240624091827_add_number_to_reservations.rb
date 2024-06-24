class AddNumberToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :number, :string
  end
end
