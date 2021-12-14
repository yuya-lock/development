Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "content" => "top#content", as: "content"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, except: [:index, :edit]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
