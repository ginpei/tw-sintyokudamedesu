Rails.application.routes.draw do
  post 'users/say'

  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy', as: :logout

  root 'misc#home'
end
