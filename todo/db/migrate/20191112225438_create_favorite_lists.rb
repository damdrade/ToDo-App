class CreateFavoriteLists < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_lists do |t|
      t.integer :todo_list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
