class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end
  
end

