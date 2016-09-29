class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.find_by(username: params["/login"][:username])
      if user && user.authenticate(params["/login"][:password])
        session[:user_id] = user.id
        flash[:notice] = "Log in successful"

        redirect_to places_path
      else
        flash[:alert] = "Incorrect login information"

        render :new
      end
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Log out successful"

    redirect_to root_path
  end

  protected
    def auth_hash
      env["omniauth.auth"]
    end

end