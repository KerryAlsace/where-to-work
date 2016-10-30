class UsersController < ApplicationController

  def most_places
    if current_user && current_user.admin?
      define_user
      
      render :show
    else
      admin_alert

      redirect_to root_path
    end
  end

  def index
    if current_user && current_user.admin?
      @users = User.all
    else
      admin_alert

      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      success_notice

      redirect_to root_path
      # redirect_to user_path(@user)
    else
      system_error_messages

      render :new
    end
  end

  def show
    define_user
    if !allowed_to_view_user?
      admin_or_user_alert

      redirect_to root_path
    end
  end

  def edit
    define_user
    if !allowed_to_view_user?
      admin_alert

      redirect_to root_path
    end
  end

  def update
    define_user
    if !allowed_to_view_user?
      login_alert

      redirect_to login_path
    end
    if @user.update(user_params)
      success_notice

      redirect_to user_path(@user)
    else
      system_error_messages

      render :edit
    end
  end

  def destroy
    define_user
    if !allowed_to_view_user?
      login_alert

      redirect_to login_path
    else
      if @user.destroy
        success_notice

        redirect_to root_path
      else
        system_error_messages

        redirect_to root_path
      end
    end
  end

  private
    def define_user
      if params[:id] != "most_places"
        @user = User.find(params[:id])
      else
        @user = User.most_places
      end
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :role)
    end

    def allowed_to_view_user?
      current_user && (current_user.admin? || (current_user == @user && !@user.oauth_user?))
    end

    def success_notice
      flash[:notice] = "Action was successful"
    end

    def admin_alert
      flash[:alert] = "Must be an admin to do that"
    end

    def admin_or_user_alert
      flash[:alert] = "Can't access another user's info unless you're an admin"
    end

    def login_alert
      flash[:alert] = "Must be logged in to do that"
    end

    def system_error_messages
      @user.errors.full_messages.each do |message|
        flash[:alert] = message
      end
    end

end
