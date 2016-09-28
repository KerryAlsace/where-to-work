Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#create'
  

  resources :users do
    resources :places
  end
  resources :places

  resources :neighborhoods, only: [:index, :show]

  root 'welcome#index'
end


#           login GET    /login(.:format)                          sessions#new
#                 POST   /login(.:format)                          sessions#create
#          logout GET    /logout(.:format)                         sessions#destroy
#     user_places GET    /users/:user_id/places(.:format)          places#index
#                 POST   /users/:user_id/places(.:format)          places#create
#  new_user_place GET    /users/:user_id/places/new(.:format)      places#new
# edit_user_place GET    /users/:user_id/places/:id/edit(.:format) places#edit
#      user_place GET    /users/:user_id/places/:id(.:format)      places#show
#                 PATCH  /users/:user_id/places/:id(.:format)      places#update
#                 PUT    /users/:user_id/places/:id(.:format)      places#update
#                 DELETE /users/:user_id/places/:id(.:format)      places#destroy
#           users GET    /users(.:format)                          users#index
#                 POST   /users(.:format)                          users#create
#        new_user GET    /users/new(.:format)                      users#new
#       edit_user GET    /users/:id/edit(.:format)                 users#edit
#            user GET    /users/:id(.:format)                      users#show
#                 PATCH  /users/:id(.:format)                      users#update
#                 PUT    /users/:id(.:format)                      users#update
#                 DELETE /users/:id(.:format)                      users#destroy
#          places GET    /places(.:format)                         places#index
#                 POST   /places(.:format)                         places#create
#       new_place GET    /places/new(.:format)                     places#new
#      edit_place GET    /places/:id/edit(.:format)                places#edit
#           place GET    /places/:id(.:format)                     places#show
#                 PATCH  /places/:id(.:format)                     places#update
#                 PUT    /places/:id(.:format)                     places#update
#                 DELETE /places/:id(.:format)                     places#destroy
#   neighborhoods GET    /neighborhoods(.:format)                  neighborhoods#index
#    neighborhood GET    /neighborhoods/:id(.:format)              neighborhoods#show
#            root GET    /                                         welcome#index