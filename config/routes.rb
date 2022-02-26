Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }
  resources :notes, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :notes, only: [:index, :show, :create, :update, :destroy]
end
