Rails.application.routes.draw do
  
  
  root to: 'static_pages#home'

  resources :piggybanks, only: [:new, :edit, :destroy]
  post 'piggybanks/new', as: 'create_piggybanks', to: 'piggybanks#create'
  put 'piggybanks/:id/edit', to: 'piggybanks#update'
  put 'piggybanks/:id/deposit', to: 'piggybanks#deposit'
  put 'piggybanks/:id/withdraw', to: 'piggybanks#withdraw'

  # User-related routes
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  get "app", to: "app_pages#home"
  #delete "account", to "users#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :password_resets, only: [:create, :edit, :new, :update], param: :password_reset_token

  # Session-related routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  delete "logout", to: "sessions#destroy"

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  
end
