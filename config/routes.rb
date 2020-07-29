Rails.application.routes.draw do
  devise_for :users
  
  root 'posts#index'
  get '/index',to: 'kiyakus#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
 
  resources :relationships,       only: [:create, :destroy]
  
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    
  end
end
