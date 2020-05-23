Rails.application.routes.draw do
  get 'oauth/callback'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root   'photo_images#index'
  get    '/photo_image/new',  to: 'photo_images#new'
  post   '/photo_image',      to: 'photo_images#create'
  post   '/twitter',          to: 'photo_images#upload'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
