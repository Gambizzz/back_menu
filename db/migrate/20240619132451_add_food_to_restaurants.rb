class AddFoodToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :food, :string
  end
end
