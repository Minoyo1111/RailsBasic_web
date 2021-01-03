Rails.application.routes.draw do
  resources :moviegroups
  root 'welcome#index'
end
