Rails.application.routes.draw do
  resources :recipes, only: :index
  resources :dishes
  resources :tags
  resources :products
  resources :categories

  root to: "recipes#index"
end
