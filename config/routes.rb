Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  post "likes/:post_id/create" => "likes#create"
  
  resources :posts do
    resources :likes
  end
  
    resources :users do
      resources :posts
  end
  
  resources :mypages, only:[:index,:show]
  
  root "messages#index"
  resources :users, only: [:edit, :update]
end
