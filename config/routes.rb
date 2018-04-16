Rails.application.routes.draw do
  resources 'categories'
  resources 'products'
  post 'products/all_products'
  resources 'sessions'
  resources 'users'
  root to: 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
