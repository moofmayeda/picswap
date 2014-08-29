Rails.application.routes.draw do
  root :to => 'users#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:edit, :update, :destroy] do
    resources :photos, except: [:edit, :update, :destroy] do
      resources :tags, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

end
