Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  # resources :users, only: %i[new create show]
  resources :books, only: %i[create index destroy update] 
end
