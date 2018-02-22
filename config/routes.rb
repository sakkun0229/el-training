Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  post "/users/create" => "users#create"
  get "/users/:id/edit" => "users#edit"
  post "/users/:id/update" => "users#update"
  post "/users/:id/destroy" => "users#destroy"

  get "/" => "posts#index"
  get "/new" => "posts#new"
  post "/posts/create" => "posts#create"
  get "/:id" => "posts#show"
  get ":id/edit" => "posts#edit"
  post "/:id/update" => "posts#update"
  post "/:id/destroy" => "posts#destroy"

  namespace :admin do
    get 'users' => 'users#index'
    get "users/:id" => "users#show"
    get "signup" => "users#new"
    post "users/create" => "users#create"
    get "/users/:id/edit" => "users#edit"
    post "/users/:id/update" => "users#update"
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
