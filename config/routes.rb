Rails.application.routes.draw do
  devise_for :users
  root "homepage#index"

  resources :user_roles, only: [:index]

  resources :topics, only: [:show] do 
  	resources :categories, only: [:show] do
  		resources :exercises, only: [:show, :create] 
  	end
  end

  get 'new_entries'   => 'new_entries_form#new'

  # API
  namespace :api, defaults: {format: 'json'} do
  	resources :user_roles, only: [:update]
  end
end
