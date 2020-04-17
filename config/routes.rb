Rails.application.routes.draw do
  post 'sessions/create'
  resources :users
  resources :authors
  resources :comics do
    get '/comic_genre', to: 'comics#comic_genre', as: '_genre'
    get '/comic_author', to: 'comics#comic_author', as: '_author'
  end
  resources :categories
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
