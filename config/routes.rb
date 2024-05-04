Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'homes/about', to: 'homes#about'
  #post 'books' => 'books#create'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
