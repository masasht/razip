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

  resources :machines do
    member do
      get :fastened
    end
  end
  
  resources :kits
  resources :relationships, only: [:create, :destroy]
  resources :clips, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]
  
  resources :makers
  resources :motors
  resources :escs
  resources :servos
  resources :receviers
  
end
