class AddRestaurantIdToReservations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :restaurant_id)
      add_column :reservations, :restaurant_id, :bigint
    end
  end
end
