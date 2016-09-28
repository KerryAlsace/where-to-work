class UsersController < ApplicationController

  def index
    if current_user && current_user.admin?
      @users = User.all
    else
      flash[:alert] = "Must be an admin to do that"

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
      flash[:notice] = "Successfully created user"

      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages

      render :new
    end
  end

  def show
    define_user
    if !(current_user && (current_user.admin? || (current_user == @user)))
      flash[:alert] = "Must be an admin to do that"

      redirect_to root_path
    end
  end

  def edit
    define_user
    if !(current_user && (current_user.admin? || (current_user == @user)))
      flash[:alert] = "Must be an admin to do that"

      redirect_to root_path
    end
  end

  def update
    define_user
    if !(current_user && (current_user.admin? || (current_user == @user)))
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
    if @user.update(user_params)
      flash[:notice] = "Successfully updated user"

      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages

      render :edit
    end
  end

  def destroy
    if current_user
      define_user
      if @user.destroy
        flash[:notice] = "Successfully deleted user"

        redirect_to root_path
      else
        flash[:alert] = @user.errors.full_messages

        redirect_to root_path
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  private
    def define_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :role)
    end

    # def can_access_this_user
    #   current_user && (current_user.admin? || (current_user == @user))
    # end

end
