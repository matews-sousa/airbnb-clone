Rails.application.routes.draw do
  post 'reservations', to: 'reservations#create'
  post 'reservations/:id/refund', to: 'reservations#refund', as: 'refund_reservation'

  post 'become_host', to: 'hosts#become_host', as: 'become_host'
  get 'connected', to: 'hosts#connected', as: 'connected'

  post 'reviews', to: 'reviews#create'

  resources :places, only: [:show, :create]
  resources :favorites, only: [:create, :destroy]

  scope '/profile' do
    get 'places', to: 'profile#places', as: 'my_places'
    get 'places/new', to: 'places#new', as: 'new_place'
    get 'favorites', to: 'profile#favorites', as: 'my_favorites'
    get 'reservations', to: 'profile#reservations', as: 'my_reservations'
    get 'reservations/:id', to: 'profile#reservation', as: 'reservation'
  end

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
  resources :webhooks, only: [:create]

  # Defines the root path route ("/")
  root "home#index"
end
