Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#index'

  resources :tweets do
    member do
      get 'likes', to: 'tweets#likes'
    end
  end

  resources :users, only: [:show, :update]
  
end
