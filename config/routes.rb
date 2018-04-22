Rails.application.routes.draw do

  resources :triagems
  resources :pacientes
  resources :situations
  resources :militaries
  resources :people
  resources :addresses
  root to: 'static_pages#index'

  # Using Devise for authentication
  devise_for :users,
    path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'senha', confirmation: 'confirmar'
    },
    controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords'
    },
    skip: [:registrations]

  devise_scope :user do
    get "login", to: "users/sessions#new"
  end

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :opms, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :permissions, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :user_permissions, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :situations

  # Rotas para aplicações React.js
  # Essa rota funciona como um entry point para a aplicação frontend
  get 'chamadas', to: 'chamadas#index'

end
