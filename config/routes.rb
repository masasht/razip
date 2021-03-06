Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'contact', to: 'toppages#contact'
  get 'privacy', to: 'toppages#privacy'
  get 'about', to: 'toppages#about'
  
  get 'login', to: 'sessions#new'
#  post 'login', to: 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  
  
  
  
  resources :users do
    member do
      get :followings
      get :followers
      get :fastenings
      get :mine
    end
  end

  resources :machines do
    member do
      get :fastened
    end
  end
  match 'hello_kit', to: 'machines#hello_kit', via: [:get, :post]
  match 'hello_motor', to: 'machines#hello_motor', via: [:get, :post]
  match 'hello_esc', to: 'machines#hello_esc', via: [:get, :post]
  match 'hello_servo', to: 'machines#hello_servo', via: [:get, :post]
  match 'hello_recevier', to: 'machines#hello_recevier', via: [:get, :post]

  
  resources :relationships, only: [:create, :destroy]
  resources :clips, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]
  
  resources :makers
  
  resources :kits do
    collection do
      get :search
    end
    member do
      post :create_ownership
      delete :destroy_ownership
    end
  end
  
  resources :motors do
    collection do
      get :search
    end
  end
  resources :escs do
    collection do
      get :search
    end
  end
  resources :servos do
    collection do
      get :search
    end
  end
  resources :receviers do
    collection do
      get :search
    end
  end
  resources :items, only: [:index]
  
  resources :ownerships, only: [:create, :destroy]
  
end
