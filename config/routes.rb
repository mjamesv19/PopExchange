Rails.application.routes.draw do
  get 'orders/new/:pop_id', to: "orders#new", as: "new_order"
  get 'orders/success', to: "orders#success", as: "order_success"
  get 'orders/cancel', to: "orders#cancel", as: "order_cancel"
  devise_for :users
  
  root 'home#index'
  delete "/pops/:id", to: "pops#destroy", as: "delete_pop"

  resources :pops
  resources :orders
  resources :home

end
