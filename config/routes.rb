Rails.application.routes.draw do
  root 'flights#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :airports, :flights, :bookings, :passengers
  # Defines the root path route ("/")
  # root "articles#index"
end
