Rails.application.routes.draw do

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

  root 'static_pages#home'

  get '/about'      , to:'static_pages#about'
  get '/help'       , to:'static_pages#help'
  get '/contact'    , to:'static_pages#contact'
  get '/adminpanel' , to:'static_pages#adminpanel'

  resources :items, only:[:new, :create, :edit, :update, :destroy]
  get '/itemsbyid'  , to:'items#byid'
  get '/itemsbycat' , to:'items#bycat'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
