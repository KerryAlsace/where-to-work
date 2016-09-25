Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :places

  root 'places#index'
end

#      users GET    /users(.:format)           users#index
#            POST   /users(.:format)           users#create
#   new_user GET    /users/new(.:format)       users#new
#  edit_user GET    /users/:id/edit(.:format)  users#edit
#       user GET    /users/:id(.:format)       users#show
#            PATCH  /users/:id(.:format)       users#update
#            PUT    /users/:id(.:format)       users#update
#            DELETE /users/:id(.:format)       users#destroy
#     places GET    /places(.:format)          places#index
#            POST   /places(.:format)          places#create
#  new_place GET    /places/new(.:format)      places#new
# edit_place GET    /places/:id/edit(.:format) places#edit
#      place GET    /places/:id(.:format)      places#show
#            PATCH  /places/:id(.:format)      places#update
#            PUT    /places/:id(.:format)      places#update
#            DELETE /places/:id(.:format)      places#destroy
#       root GET    /                          places#index
