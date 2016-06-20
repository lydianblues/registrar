Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
   }

  root to: 'home#index'

  get '/students/datatables', to: 'students#datatables'

  resources :groups
  resources :registrations
  resources :trainings
  resources :locations
  resources :facilitators
  resources :courses
  resources :students
  resources :organizations
  resources :transactions

  post '/api/register', to: 'api#create'
  get '/api/register/:id', to: 'api#show'
  put '/api/register/:id', to:'api#update'
  get '/api/transaction/:id/refresh', to: 'api#refresh'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
