Rails.application.routes.draw do
  get 'places/show/:id', to: 'place#show', as: 'place_show'
  get 'places/new', to: 'place#new', as: 'place_new'
  post 'places', to: 'place#create'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
