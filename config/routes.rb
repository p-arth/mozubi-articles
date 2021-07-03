Rails.application.routes.draw do
  resources :articles, only: [:show]
  root to: 'articles#index'
end
