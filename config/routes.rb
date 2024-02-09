Rails.application.routes.draw do

  match 'event_a', to: 'event#event_a', via: [:get, :post]
  match 'event_b', to: 'event#event_b', via: [:get, :post]

  devise_for :users

  root 'home#index'
end
