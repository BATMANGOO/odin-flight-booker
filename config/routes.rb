Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :flights
  resources :bookings

  root 'flights#index'
end
