Rails.application.routes.draw do
root to: 'homes#top', as: 'root'
devise_for :users
resources :books, only: [:edit, :index, :show, :new, :create]
resources :users, only: [:show, :edit, :update]

get "homes/about" => "homes#about", as: "about"

end
