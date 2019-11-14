Rails.application.routes.draw do
  	devise_for :users
    resources :tasks
    resources :todo_lists do
	  	put :favorite, on: :member
	end

    root "todo_lists#index"
  
    get "delete/delete_marked"
    get "delete/delete_all"
    get "todo_lists/favorites"
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
