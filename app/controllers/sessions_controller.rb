class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Log in successful"

      redirect_to root_path
    else
      flash[:alert] = "Log in unsuccessful"

      render 'sessions#new'
    end
  end

  def destroy
    session.delete :id
    flash[:notice] = "Log out successful"

    redirect_to root
  end

end