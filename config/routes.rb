Rails.application.routes.draw do
  resources :notes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :notes, only: [:index, :show, :create, :update, :destroy]
  resources :users
  post '/auth/login', to: 'authentication#login'
end
