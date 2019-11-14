class CreateTodoLists < ActiveRecord::Migration[6.0]
    def change
    	create_table :todo_lists do |t|
      	  	t.string :description
      		t.boolean :completed

      		t.timestamps
    	end
    end
end
