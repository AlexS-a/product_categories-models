Rails.application.routes.draw do
  root to: 'pages#home'

  resources :categories, only: [:index, :show, :new, :create]
  resources :products, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
