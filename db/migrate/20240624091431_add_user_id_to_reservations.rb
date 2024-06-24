class AddUserIdToReservations < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :user_id)
      add_reference :reservations, :user, null: false, foreign_key: true
    end
  end
end
