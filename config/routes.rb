Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get 'login', to: 'sessions#new'
  get 'login/create', to: 'sessions#create', as: :create_login
  get 'logout', to: 'sessions#destroy'

  get 'join', to: 'invitations#create'

  resources :users
  resources :groups do
    get :draws, to: 'draws#create', as: 'draws'
    get :friends, to: 'friends#show', as: 'friends'
  end
end
