Rails.application.routes.draw do
  get 'places/show/:id', to: 'place#show', as: 'show_place'
  get 'places/new', to: 'place#new', as: 'new_place'
  post 'places', to: 'place#create'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
