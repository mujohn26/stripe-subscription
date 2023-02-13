Rails.application.routes.draw do
  get 'dashboard/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homepage#index"

  get 'payments/new' => 'payments#new'
  post 'payments' => 'payments#create'
  get 'payments/success' => 'payments#success'
  get 'redirect_to_root', to: 'dashboard#redirect'
end
