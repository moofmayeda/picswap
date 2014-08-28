Rails.application.routes.draw do
  root :to => 'users#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :photos do
      resources :tags
    end
  end
  resources :sessions

end
