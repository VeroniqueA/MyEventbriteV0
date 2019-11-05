Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/secret'
  get 'events/index'
  
  devise_for :users
  
  root 'events#index'
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'static_pages#index'
end
