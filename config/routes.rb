Rails.application.routes.draw do
  resources :units
  resources :bookings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "bookings#new"
end

