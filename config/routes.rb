Rails.application.routes.draw do
  resources :videos
  resources :posts
  devise_for :users
  get 'bandposts/index'
  root to: "bandposts#index"
  resources :bandposts do
    collection do
      get 'search'
      get 'select_category_index'
    end
  end
  resources :soloposts do
    collection do
      get 'search'
      get 'select_category_index'
    end
  end
  resources :users, only: :show
end
