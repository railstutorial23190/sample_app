Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to:"users#new"
  
  root 'static_pages#home'
  get   '/contact', to: 'static_pages#contact'
  get   '/about',   to: 'static_pages#about'
  get   '/help',    to: 'static_pages#help'
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete'/logout',  to: 'sessions#destroy'
  resources :users
end