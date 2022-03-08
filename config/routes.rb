Rails.application.routes.draw do
  resources :books
  resources :author
  get '/genres', to: 'books#genres'
  post '/login', to: 'auth#login'
  get '/auth', to: 'auth#persist'
  post '/sign-up', to: 'registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
