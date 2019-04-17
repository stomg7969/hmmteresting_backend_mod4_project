Rails.application.routes.draw do
  resources :interests
  resources :products


  get "/companies/:id/products", to: "companies#company_products"

  namespace :api do
    namespace :v1 do
      resources :auth
      resources :users
      resources :companies
      get '/get_user', to: 'users#get_user'
      get '/get_company', to: 'companies#get_company'
      post '/login_user', to: 'auth#create'
      post '/login_company', to: 'auth#create_company'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
