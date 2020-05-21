Rails.application.routes.draw do
  root   'photo_images#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :photo_images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
