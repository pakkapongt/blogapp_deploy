Rails.application.routes.draw do
  devise_for :users

  # Routes for posts
  resources :posts do
    # Nested route for comments
    resources :comments, only: [:create]
    
    # Custom route for liking a post
    post 'like', on: :member
  end

  # Set the root path of your application
  root to: 'posts#index'
end
