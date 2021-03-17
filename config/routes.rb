Rails.application.routes.draw do
  get 'orders/new'
  devise_for :users
  
  root 'home#index'
  delete "/pops/:id", to: "pops#destroy", as: "delete_pop"

  resources :pops
  resources :home

end
