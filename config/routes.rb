Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
   }

  root to: 'home#index'

  get '/courses/datatables', to: 'courses#datatables'
  get '/facilitators/datatables', to: 'facilitators#datatables'
  get '/groups/datatables', to: 'groups#datatables'
  get '/locations/datatables', to: 'locations#datatables'
  get '/organizations/datatables', to: 'organizations#datatables'
  get '/registrations/datatables', to: 'registrations#datatables'
  get '/students/datatables', to: 'students#datatables'
  get '/trainings/datatables', to: 'trainings#datatables'
  get '/transactions/datatables', to: 'transactions#datatables'

  resources :groups
  resources :registrations
  resources :trainings
  resources :locations
  resources :facilitators
  resources :courses
  resources :students
  resources :organizations
  resources :transactions

  post '/groups/:id/add', to: 'groups#add' # add a group member
  post '/groups/:id/remove', to: 'groups#remove' # remove a group member

  post '/api/register', to: 'api#create'
  get '/api/register/:id', to: 'api#show'
  put '/api/register/:id', to:'api#update'
  put '/api/register/:id/refund', to: 'api#refund'
  put '/api/register/:id/cancel', to: 'api#cancel'
  get '/api/transaction/:id/refresh', to: 'api#refresh'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
