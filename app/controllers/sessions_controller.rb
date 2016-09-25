class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'sessions#new'
    end
  end

  def destroy
    session.delete :id
    redirect_to root
  end

end