Rails.application.routes.draw do
  resources :users
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  resources :events
  resources :comments
  resources :patrons
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
