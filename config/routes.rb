Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :new, :create, :show]
end
