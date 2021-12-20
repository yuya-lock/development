Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "content" => "top#content", as: "content"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # エラー処理
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resources :users, only: [:new, :create, :show] do
    resources :posts, only: [:index]
  end

  resource :account, only: [:show, :edit, :update, :destroy]
  resource :password, only: [:show, :edit, :update]
  resources :posts
end