Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :api do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :restricted, only: [:index]
  end
end
