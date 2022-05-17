Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :events

  post '/events/:id/attend', to: 'events#attend'
  # Defines the root path route ("/")
  root "events#index"
end
