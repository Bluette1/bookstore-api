Rails.application.routes.draw do
  root to: 'books#index'
  # resources :users, only: %i[new create show]
  resources :books, only: %i[create index destroy] 
end
