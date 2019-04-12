Rails.application.routes.draw do
  resources :interests
  resources :users
  resources :products
  resources :companies


  get "/companies/:id/products", to: "companies#company_products"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
