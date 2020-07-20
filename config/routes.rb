Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :plantcollections
      resources :plantcards
      resources :canvas
      resources :users, only: [:create]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/profile', to: 'users#profile'
    end
  end
end
