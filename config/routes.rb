Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    post '/signup', to: 'users#create'

    get '/properties', to: 'properties#index'
  end
end
