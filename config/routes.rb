Harigami::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  namespace :admin do
    resources :designs, except: [:index, :show]
    resources :shapes, except: :show
    resources :purchases, only: [:index]
  end
  resources :designs, only: [:show, :index]
  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:show]
  resources :users, only: [:index]
  resources :orders, only: [:new]
  resources :purchases, only: [:new, :create]

  root to: "static#index"

  get "admin" => "admin/shapes#index"
end
