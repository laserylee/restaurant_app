Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  get '/about'      , to:'static_pages#home'
  get '/help'       , to:'static_pages#help'
  get '/contact'    , to:'static_pages#contact'
  get '/adminpanel' , to:'static_pages#adminpanel'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
