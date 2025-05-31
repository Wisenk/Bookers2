Rails.application.routes.draw do
root to: 'homes#top', as: 'root'
devise_for :users
resources :books, only: [:edit, :index, :show, :create, :update, :destroy, :new]
resources :users, only: [:index, :show, :edit, :update, :destroy]
get "homes/about" => "homes#about", as: "about"

end
