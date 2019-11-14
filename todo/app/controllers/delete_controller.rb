class DeleteController < ApplicationController
	def delete_marked
		@delete_marked = TodoList.where(:user_id => current_user.id).where(:completed => true).destroy_all
		redirect_to root_url, notice: "Todos as listas concluídas foram excluídas"
	end

	def delete_all
		@delete_all = TodoList.where(:user_id => current_user.id).destroy_all
		redirect_to root_url, notice: "Todos as listas foram excluídas"
	end
end