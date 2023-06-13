Rails.application.routes.draw do
  get '/signup', to:"users#new"
  
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/about',   to: 'static_pages#about'
  get '/help',    to: 'static_pages#help'
  resources :users
end