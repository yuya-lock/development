Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "content" => "top#content", as: "content"
end
