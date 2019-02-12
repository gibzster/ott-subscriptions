Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # get '/subscription', to: 'subscriptions#index'
  # get '/subscription'

  resources :subscriptions do
    # resources :comments
  end
end
