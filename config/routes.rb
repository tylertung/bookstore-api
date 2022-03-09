Rails.application.routes.draw do
  resources :books do
    resources :comments, only: %i[create destroy]
    resources :rates, only: %i[create destroy]
  end
  resources :author
  get '/genres', to: 'books#genres'
  post '/login', to: 'auth#login'
  get '/auth', to: 'auth#persist'
  post '/sign-up', to: 'registrations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
