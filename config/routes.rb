Rails.application.routes.draw do
  devise_for :users

  resources :expense_categories
  resources :categories, only: %i[index create new destroy] do
    resources :expenses
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  root 'categories#index'
end
