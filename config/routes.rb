Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get 'login', to: 'sessions#new'
  get 'login/create', to: 'sessions#create', as: :create_login



  resources :users
end
