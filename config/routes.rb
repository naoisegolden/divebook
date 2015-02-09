Divebook::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  #Locations
  resources :locations

  # Users
  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => 'users/omniauth_callbacks' }
  resources :users, :only => :show

  # Static pages
  root "static#index"
  get "about", to: "static#about"
end
