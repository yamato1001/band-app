Rails.application.routes.draw do
  devise_for :users
  get 'bandposts/index'
  root to: "bandposts#index"
end
