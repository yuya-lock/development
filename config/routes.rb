Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "content" => "top#content", as: "content"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, except: [:index]
end
