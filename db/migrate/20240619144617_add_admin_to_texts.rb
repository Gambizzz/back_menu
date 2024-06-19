class AddAdminToTexts < ActiveRecord::Migration[7.1]
  def change
    add_reference :texts, :admin, null: false, foreign_key: true
  end
end
