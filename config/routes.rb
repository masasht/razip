Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users do
    member do
      get :followings
      get :followers
      get :fastenings
    end
  end

  resources :relationships, only: [:create, :destroy]
  
  resources :machines do
    member do
      get :fastened
    end
  end
  
  resources :clips, only: [:create, :destroy]
  resources :kits
  resources :makers
  resources :motors
  resources :escs
  resources :servos
  resources :receviers
  resources :microposts, only: [:create, :destroy]
end
