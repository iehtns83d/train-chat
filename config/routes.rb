Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :users, only: [:edit, :update]
  resources :lines, only: [:edit, :update] do
    resources :stations, only: [:index] do
      resources :messages, only: [:index,:create]
      namespace :api do
        resources :messages, only: :index, defaults: { format: 'json' }
      end
    end
  end
end
