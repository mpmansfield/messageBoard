Rails.application.routes.draw do
  resources :discipline_requests
  resources :user_disciplines
  resources :disciplines
  resources :comments
  resources :discussions
  resources :boards
  resources :disciplines
  resources :user_disciplines
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', confirmations: 'confirmations' }
  resources :users, :only => [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "boards#index"

  as :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end

  get 'users', :to => 'users#index'
  get 'users/list_confirmed', :to => 'users#list_confirmed', as: 'list_confirmed'
  get 'user/assign/:id', :to => 'users#assign', as: 'assign'
  put 'user/assign/:id', :to => 'users#assign_user', as: 'assign_user'
  get 'user/assign_request/:id/:request', :to => 'users#assign_request', as: 'assign_request'
  put 'user/assign_request/:id/:request', :to => 'users#assign_user_request', as: 'assign_user_request'
  get 'user/:id', :to => 'users#show', as: 'user'
  patch 'user/:id', :to => 'users#update'
  get 'user/:id/confirm/:confirmation_token', :to => 'users#confirmation', as: 'confirm'
  get 'user/:id/registration_edit', :to => 'users#registration_edit', as: 'new_user'
  put 'user/edit/:id', :to => 'users#update', as: 'registration_edit'



end
