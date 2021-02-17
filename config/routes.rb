Rails.application.routes.draw do
  get 'bandposts/index'
  root to: "bandposts#index"
end
