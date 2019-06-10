Rails.application.routes.draw do
  get 'mypage/index'
  devise_for :users
  root 'posts#index'
  get '/posts/hashtag/:name', to:'posts#hashtags'
  get '/posts/user/:id', to:'posts#user'
  
  resources :posts, except: [:show] do
      post "/like", to: "likes#like_toggle"
      resources :comments, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
