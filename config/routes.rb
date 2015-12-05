Rails.application.routes.draw do
  root "homepage#index"

  resources :topics, only: [:show] do 
  	resources :categories, only: [:show] do
  		resources :exercises, only: [:show, :create] 
  	end
  end
end
