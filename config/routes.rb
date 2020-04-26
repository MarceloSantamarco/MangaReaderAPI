Rails.application.routes.draw do
  post 'sessions/create'
  resources :users
  resources :authors
  resources :comics do
    get '/comic_genre', to: 'comics#comic_genre', as: '_genre'
    get '/comic_author', to: 'comics#comic_author', as: '_author'
  end
  get 'related_comics', to: 'comics#related_comics', as: 'related_comics'
  resources :categories
  resources :genres
  resources :search, only: :index
  resources :favorites
  resources :ratings, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
