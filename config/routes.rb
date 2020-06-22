Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
    resources :users do
      resources :posts
  end
  
  resources :mypages, only:[:index,:show]
  
  root "messages#index"
  resources :users, only: [:edit, :update]
end
