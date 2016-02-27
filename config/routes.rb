Rails.application.routes.draw do
  devise_for :users
  root "homepage#index"

  resources :user_roles, only: [:index]

  resources :topics, only: [:show] do 
    resources :spelling_tasks, only: [:new]
    resources :categories, only: [:show] do
  		resources :exercises, only: [:show, :create] 
  	end
  end

  # API
  namespace :api, defaults: {format: 'json'} do
  	resources :user_roles, only: [:update]
    resources :category_spelling_tasks, only: [:show]
    resources :spelling_tasks, only: [:create, :destroy]
    resources :topic_categories, only: [:show]
    resources :categories, only: [:create, :update, :destroy]
  end
end
