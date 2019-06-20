Rails.application.routes.draw do

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations' 
  }, path_names: {
    sign_in: 'login',
    sign_out:'logout',
    sign_up: 'signup'
  }
  resources :users, only: [:index, :show]

  root 'static_pages#home'

  get '/about'      , to:'static_pages#about'
  get '/help'       , to:'static_pages#help'
  get '/contact'    , to:'static_pages#contact'
  get '/adminpanel' , to:'static_pages#adminpanel'

  resources :items, only:[:new, :create, :edit, :update, :destroy]
  get '/itemsbyid'  , to:'items#byid'
  get '/itemsbycat' , to:'items#bycat'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:edit, :update, :destroy, :index, :show]
  get '/orders/done/:id'  , to:'orders#done'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
