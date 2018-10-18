Rails.application.routes.draw do

  get 'products/index'

  get 'customers/index'

  get 'homepage/info'

  devise_for :users
  root 'homepage#index'
  resources :categories, except: [:show]
  resources :tables, except: [:show]
  resources :customers, except: [:show]
  resources :products, except: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
