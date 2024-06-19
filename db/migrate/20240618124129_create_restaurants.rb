class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
