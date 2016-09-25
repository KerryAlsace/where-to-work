Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # get '/login' => "sessions#new"
  # post '/login' => "sessions#create"
  # post '/destroy' => "sessions#destroy"

  resources :users, :places

  root 'places#index'
end

  ## add this when adding user friends?
  # resources :users do
  #   resources :friends
  # end
