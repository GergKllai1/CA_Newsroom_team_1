Rails.application.routes.draw do

  devise_for :users
  root controller: :articles, action: :index

  resources :articles, only: [:index, :show] do
    resources :comments, only: [:create, :update]
  end

  resources :categories, only: [:show]

  namespace :api do
    resources :articles, only: [:index]
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  end

  namespace :cms do
    resources :articles
    resources :transactions, only: [:new, :create]
    resources :users, only: [:update]
  end

end