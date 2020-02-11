Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  post '/usr/search', to: 'usrs#search', as: 'search_usrs'
  post '/video_call/broadcast_data', to: 'video_calls#broadcast_data', as:'data_video_calls'
  post '/video_call/broadcast_signaling', to: 'video_calls#broadcast_signal', as:'signal_video_calls'
  post '/video_call/answer', to: 'video_calls#answer', as:'answer_video_calls'


  root 'posts#index' 
  resources :posts
  resources :comments
  resources :likes
  resources :usrs
  resources :follows
  resources :req_friends
  resources :friends
  resources :chats
  resources :rooms
  resources :video_calls
  mount Sidekiq::Web, at: '/sidekiq'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
    get 'auth/:provider/callback', to: 'sessions#create'

  devise_scope :user do
    post '/signup' => 'registrations#create', :as => :user_cregistration
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
