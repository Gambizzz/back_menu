class AddRestaurantIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :restaurant_id, :bigint
  end
end
