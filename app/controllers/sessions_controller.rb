class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by(username: params["/login"][:username])
  #   if user && user.authenticate(params["/login"][:password])
  #     session[:user_id] = user.id
  #     flash[:notice] = "Log in successful"

  #     redirect_to places_path
  #   else
  #     flash[:alert] = "Log in unsuccessful"

  #     render 'sessions#new'
  #   end
  # end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # def create
  #   if auth
  #     user = User.find_or_create_by(uid: auth[:uid][0, 8]) do |u|
  #       u.username = auth['info']['name']
  #       u.password = "placeholder"
  #       u.role = "user"
  #     end
  #     session[:user_id] = user.id
  #   else
  #     user = User.find_by(username: params["/login"][:username])
  #     if user && user.authenticate(params["/login"][:password])
  #       session[:user_id] = user.id
  #       flash[:notice] = "Log in successful"

  #       redirect_to places_path
  #     else
  #       flash[:alert] = "Log in unsuccessful"

  #       render 'sessions#new'
  #     end
  #   end
  # end

  # def destroy
  #   session.clear
  #   flash[:notice] = "Log out successful"

  #   redirect_to root_path
  # end

  # protected
  #   def auth
  #     request.env['omniauth.auth']
  #   end

end