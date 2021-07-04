Rails.application.routes.draw do
  resources :articles, only: [:show, :new, :create]
  get '/articles' => redirect('/')
  root to: 'articles#index'
end
