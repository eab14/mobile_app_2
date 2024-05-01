Rails.application.routes.draw do

  scope '/api' do
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end

  namespace :api do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :restricted, only: [:index]
  end

end
