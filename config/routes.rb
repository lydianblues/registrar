Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'students#index'

  resources :users
  resources :groups
  resources :registrations
  resources :trainings
  resources :locations
  resources :facilitators
  resources :courses
  resources :students
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
