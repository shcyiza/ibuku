Rails.application.routes.draw do
  resources :problematics
  resources :notes
  resources :works
  resources :ideas
  resources :shelves
  devise_for :users
  resources :sources do
  	resources :reviews
  end
  root 'sources#index'
end
