Rails.application.routes.draw do
  post 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :authors
  resources :comics
  resources :categories
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
