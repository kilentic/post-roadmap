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
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    get 'auth/:provider/callback', to: 'sessions#create'
end
