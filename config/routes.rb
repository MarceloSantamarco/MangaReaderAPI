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
  get 'user_favorites', to: 'favorites#user_favorites'

  resources :ratings, only: [:index, :create]
  get 'ratings_count', to: 'ratings#ratings_count'

  resources :comments, only: [:index, :create, :destroy]

  resources :chapters
end
