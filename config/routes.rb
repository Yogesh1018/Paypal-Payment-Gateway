Rails.application.routes.draw do
  
  resources :orders, only:[:new, :create, :show, :index]

  root :to => 'books#index'
  
  get 'order/express', :to => "orders#express", as: :express_new_order

  get 'order/recuring', :to => "orders#recuring", as: :recuring_new_order 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "movie_ticket#index"

  get '/tickets', :to => "movie_ticket#index", as: :ticket

  resource :bookings, only: [:show, :create, :new]
end
