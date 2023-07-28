Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'

  # get '/users', to: 'users#index'

  # get '/users/:id', to: 'users#show'

  # get '/users/:id/posts', to: 'posts#index'

  # get '/users/:id/posts/new', to: 'posts#new'

  # get '/users/:id/posts/:post_id', to: 'posts#show'

  # get 'users/:id/posts/:post_id/comments/new', to: 'comments#new'

  # post 'users/:id/posts/:post_id/comments/create', to: 'comments#create'

  # post 'users/:id/posts/:post_id/likes/create', to: 'likes#create'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:new, :index, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
  post '/users/:id/posts/create', to: 'posts#create'

  namespace :api do
    namespace :v1 do
      get '/user/:id/posts', to: 'posts#index'
      get '/post/:id/comments', to: 'comments#index'
      post 'post/:id/comment', to: 'comments#create'
    end
  end

  post '/auth/login', to: 'authentication#login'
end
