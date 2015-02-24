Harigami::Application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :designs, except: [:index, :show]
    resources :shapes, except: :show
  end
  resources :designs, only: [:show, :index]
  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:show]
  resources :users, only: [:index]
  resources :orders, only: [:new]

  root to: "static#index"

  get "admin" => "admin/shapes#index"
end
