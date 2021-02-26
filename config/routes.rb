Rails.application.routes.draw do
  resources :videos
  resources :posts
  devise_for :users
  get 'bandposts/index'
  root to: "bandposts#index"
  resources :bandposts
  resources :soloposts, only: :index
end
