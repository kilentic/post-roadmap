Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'posts#index' 
  resources :posts
  resources :comments
  resources :likes
  resources :usrs
  resources :follows
  resources :req_friends
  resources :friends
  mount Sidekiq::Web, at: '/sidekiq'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    get 'auth/:provider/callback', to: 'sessions#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
