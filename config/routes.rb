Rails.application.routes.draw do

  root to: 'bookmarks#index'
  resources :users, only: [:create, :show, :edit, :update]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"
  resources :bookmarks
  resources :tags, only: [:show]
  post '/tags/generate', to: 'bookmarks#generate_suggested_tags', as: 'generate_tags'

end
