class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params["/login"][:username])
    if user && user.authenticate(params["/login"][:password])
      session[:user_id] = user.id
      flash[:notice] = "Log in successful"

      redirect_to places_path
    else
      flash[:alert] = "Log in unsuccessful"

      render 'sessions#new'
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Log out successful"

    redirect_to root_path
  end

end