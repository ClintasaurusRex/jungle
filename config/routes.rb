Rails.application.routes.draw do
  # Authentication routes
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'

  # User authentication routes with friendly URLs
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # User registration routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Admin category management routes
  namespace :admin do
    get 'categories/index'
    get 'categories/new'
    get 'categories/create'
  end

  # Static pages
  get 'about/index'

  # Set the root path to the products index
  root to: 'products#index'

  # Product and category routes for customers
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  # Shopping cart routes
  resource :cart, only: [:show] do
    post :add_item
    post :remove_item
  end

  # Order management for customers
  resources :orders, only: [:create, :show]

  # Admin namespace for backend management
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create, :show, :destroy]
  end

end