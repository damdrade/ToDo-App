class AddUniqueIdToTodoLists < ActiveRecord::Migration[6.0]
  	def change
  		add_column :todo_lists, :unique_id, :float
 	end
end