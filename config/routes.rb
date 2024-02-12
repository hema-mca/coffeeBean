Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :events, defaults: { format: :json }
    end
  end

  resources :events
  devise_for :users

  root 'home#index'
end


