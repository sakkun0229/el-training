Rails.application.routes.draw do

  get "/users/index"
  get "/login" => "users#login_form"
  post "login" => "users#login"

  get '/' => "home#index"

  get "new" => "home#new"
  post "create" => "home#create"

  get ":id" => "home#show"

  get ":id/edit" => "home#edit"
  post ":id/update" => "home#update"
  post ":id/destroy" => "home#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
