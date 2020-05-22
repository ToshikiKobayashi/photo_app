Rails.application.routes.draw do
  get 'oauth/callback'
  root   'photo_images#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resource   :photo_image
  post   '/twitter', to: 'photo_images#upload'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
