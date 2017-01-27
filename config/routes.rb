Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :origin_types
  resources :problematics
  resources :notes
  resources :works
  resources :ideas
  resources :shelves
  devise_for :users
  resources :origins do
  resources :reviews
  end
  get 'notes/:id/links', to:"notes#link_to_ideas"
  get 'linktoidea', to:"application#link_it"
  root 'origins#index'
end
