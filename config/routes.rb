Divebook::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dives, except: [:new, :edit]
      resources :divesites, except: [:new, :edit]
      resources :users, except: [:create, :new, :edit]
      post 'auth', to: 'users#auth'
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
