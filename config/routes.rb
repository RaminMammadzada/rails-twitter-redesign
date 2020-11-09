Rails.application.routes.draw do
  resources :followings, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :edit, :show, :new, :create, :update, :destroy]

  root "opinions#index"

  resources :sessions, only: [:new, :create, :destroy]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  get "vote", to: "opinions#update_vote", as: "vote"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
