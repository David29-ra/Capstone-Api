Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    post '/signup', to: 'users#create'

    get '/properties', to: 'properties#index'
    post '/properties', to: 'properties#create'
    patch '/properties/:id', to: 'properties#update'
    delete '/properties/:id', to: 'properties#destroy'

    post '/favorites', to: 'favorites#create'
    delete '/favorites/:id', to: 'favorites#destroy'

    post '/contacts', to: 'contacts#create'
    delete '/contacts/:id', to: 'contacts#destroy'
  end
end
