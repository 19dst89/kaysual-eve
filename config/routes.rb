Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  get '/users/:id', to: 'users#show', as: 'user'

  # Character Routes
  get "/characters", to: "characters#index"
  get "/characters/:id", to: "characters#show", as: "character"
end
