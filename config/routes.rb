Rails.application.routes.draw do
  root to:'tops#index'
  resources :mutters do
    collection do
      post :confirm
    end
  end
end
