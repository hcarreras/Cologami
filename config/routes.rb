Harigami::Application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  get "/admin" => "admin/shapes#index"
  get "/account" => "users#show"
  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  namespace :admin do
    resources :designs, except: [:index, :show]
    resources :shapes, except: :show
    resources :purchases, only: [:index]
  end
  resources :line_items, only: [:create, :destroy]
  resources :users, only: [:index, :show]
  resources :purchases
  resources :static, only: [:index, :show], path: '/'
  resources :shape_prices, only: [:show]


  root to: "static#index"
  
  get '/:id' => 'static#show'
end
