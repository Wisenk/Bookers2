Rails.application.routes.draw do
root to: 'homes#top', as: 'root'
devise_for :users
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:index, :show, :edit, :update]
get "homes/about" => "homes#about", as: "about"

end
