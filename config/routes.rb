Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  get '/users/:id', to: 'users#show', as: 'user'

  # Character Routes
  get "/toons", to: "toons#index"
  get "/toons/new", to: "toons#new", as: "new_character"
  get "/toons/:id", to: "toons#show", as: "character"
  post "/toons", to: "toons#create"
  get "/toons/:id/edit", to: "toons#edit", as: "edit_character"
  patch "/toons/:id", to: "toons#update"
end
