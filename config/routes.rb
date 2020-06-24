Rails.application.routes.draw do
  resources :comments
  resources :discussions
  resources :boards
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, :only => [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "boards#index"

  as :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end

  get 'users', :to => 'users#index'
  get 'user/:id', :to => 'users#show', as: 'user'
  patch 'user/:id', :to => 'users#update'
  get 'user/:id/confirm/code', :to => 'users#confirmation'
  get 'user/:id/registration_edit', :to => 'users#registration_edit', as: 'new_user'

end
