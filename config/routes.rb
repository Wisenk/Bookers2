Rails.application.routes.draw do
  devise_for :users
root 'homes#top'
resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]

get "homes/about" => "homes#about", as: "about"
end
