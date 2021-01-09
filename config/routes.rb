Rails.application.routes.draw do
  root 'moviegroups#index'
  devise_for :users
  resources :moviegroups do
    resources :posts
  end
  
end
