Rails.application.routes.draw do
  root to:'tops#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :mutters do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
end
