Rails.application.routes.draw do
  root to: 'static_pages#home'

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
end
