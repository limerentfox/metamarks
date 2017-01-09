Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
