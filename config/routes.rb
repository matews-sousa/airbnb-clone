Rails.application.routes.draw do
  post 'reservations', to: 'reservations#create'
  get 'profile/places', to: 'places#index', as: 'my_places'
  get 'profile/places/new', to: 'places#new', as: 'new_place'
  resources :places, only: [:show, :create]

  resources :favorites, only: [:create, :destroy]

  get 'profile/favorites', to: 'favorites#index', as: 'my_favorites'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
    edit: 'profile'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
