Rails.application.routes.draw do
  post 'users/say'
  get 'misc/say'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy', as: :logout
  resources :users
  root 'misc#home'
end
