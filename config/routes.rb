Rails.application.routes.draw do
  resources :interests
  resources :products
  resources :companies

  get "/companies/:id/products", to: "companies#company_products"

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
