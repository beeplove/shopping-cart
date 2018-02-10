Rails.application.routes.draw do
  resources :products, only: [:create, :index, :show]

  resources :customers, only: [:create, :index, :show] do
    resources :orders, only: [:create, :index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
