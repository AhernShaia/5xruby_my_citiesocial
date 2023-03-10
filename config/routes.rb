Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'pages#home'
  resources :products, only: [:index, :show]

  namespace :admin do
    root 'products#index' #/admin
    resources :products, except: [:show]
    resources :vendors, except: [:show]
  end
end
