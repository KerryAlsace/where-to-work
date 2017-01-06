Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :users do
    resources :places
  end
  resources :places do
    resources :comments
  end

  resources :neighborhoods, only: [:index, :show]

  get 'neighborhoods/:neighborhood_id/places', to: 'places#neighborhood_places', as: 'get_neighborhood_places'

  root 'welcome#index'

  # post '/users/:user_id/places/:id', to: 'places#add_comment', as: 'add_comment'

  get '/users/most_places' => 'users#most_places'
end
