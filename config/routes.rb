Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
  end
  root to: 'books#index'
    resources :readings, only: [:destroy, :index, :update], controller: 'readings'
  resources :books, only: %i[create index destroy update] do
    resources :readings, only: [:create], controller: 'readings'
  end
end
