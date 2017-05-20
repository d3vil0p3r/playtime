Rails.application.routes.draw do
  get 'wishlist_items/index'
  root to: "wishlist_items#index"
  resources :wishlists
  resources :users, only: [:show, :index, :edit, :update, :destroy]

  # OAuth
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  #item
  get '/items/search', to: 'items#search', as: 'search'
  get '/items/results', to: 'items#results', as: 'results'
  post '/items/search_amazon', to: 'items#search_amazon', as: 'search_amazon'
  resources :items
end
