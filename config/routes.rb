Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'users/index'
  root 'static_pages#home'
  get :about,  to: 'static_pages#about'
  get :signup, to: 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :cooks
  resources :notifications, only: :index
  get    :login,     to: 'sessions#new'
  post   :login,     to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'
  post   "favorites/:cook_id/create"  => "favorites#create"
  delete "favorites/:cook_id/destroy" => "favorites#destroy"
  
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
