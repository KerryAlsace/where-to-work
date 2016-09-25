class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
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

# def create
#     user = User.find_by(name: params[:user][:name])
#     user = user.try(:authenticate, params[:user][:password])
#     return redirect_to(controller: 'sessions', action: 'new') unless user
#     session[:user_id] = user.id
#     @user = user
#     redirect_to(controller: 'welcome', action: 'home')
#   end

#   def destroy
#     session.delete :user_id
#     redirect_to(controller: 'sessions', action: 'new')
#   end