Rails.application.routes.draw do
  
  resources :orders, only:[:new, :create, :show]

  root :to => 'orders#index'
  
  get 'order/express', :to => "orders#express", as: :express_new_order 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
