Rails.application.routes.draw do
  resources :contacts
  root to:'tops#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :mutters do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
