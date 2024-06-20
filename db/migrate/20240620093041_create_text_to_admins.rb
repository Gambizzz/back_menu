class CreateTextToAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :text_to_admins do |t|
      t.references :text, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
