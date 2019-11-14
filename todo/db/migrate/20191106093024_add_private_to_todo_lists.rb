class AddPrivateToTodoLists < ActiveRecord::Migration[6.0]
  	def change
    	add_column :todo_lists, :private, :boolean
  	end
end
