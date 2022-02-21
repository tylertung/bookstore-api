Rails.application.routes.draw do
  resources :books
  resources :author
  resources :sessions, only: [:create]
  post '/sign-up', to: 'registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
