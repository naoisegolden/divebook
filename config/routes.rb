Divebook::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :images, except: [:new, :edit]
      get 'dives/:dive_id/images',         to: 'images#index'
      get 'divesites/:divesite_id/images', to: 'images#index'
      get 'users/:user_id/images',         to: 'images#index'

      resources :dives, except: [:new, :edit]
      get 'divesites/:divesite_id/dives', to: 'dives#index'
      get 'users/:user_id/dives',         to: 'dives#index'

      resources :divesites, except: [:new, :edit]
      get 'users/:user_id/divesites', to: 'divesites#index'

      resources :users, only: [:show, :update, :destroy]
      get 'divesites/:divesite_id/users', to: 'users#index'
      post 'auth', to: 'users#auth'
    end
  end

  #Locations
  resources :locations
devise_for
  # Users
  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => 'users/omniauth_callbacks' }
  resources :users, :only => :show

  # Static pages
  root "static#index"
  get "about", to: "static#about"
end
