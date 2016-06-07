Rails.application.routes.draw do

  resources :transactions
  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
   }

  root to: 'home#index'

  resources :groups
  resources :registrations
  resources :trainings
  resources :locations
  resources :facilitators
  resources :courses
  resources :students

  post '/api/register', to: 'api#create'
  get '/api/register/:id', to: 'api#show'
  put '/api/register/:id', to:'api#update'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
