Rails.application.routes.draw do

  # TODO: skus and product_categories to be nested of product resource
  resources :product_categories, only: [:create, :index, :show]
  resources :skus, only: [:create, :index, :show]
  resources :products, only: [:create, :index, :show]

  resources :customers, only: [:create, :index, :show] do
    resources :orders, only: [:create, :index, :show] do
      resources :lineitems, only: [:create, :index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
