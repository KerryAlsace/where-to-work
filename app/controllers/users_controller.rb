class UsersController < ApplicationController

  def index
    if current_user
      @users = User.all
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    if current_user
      @user = User.new
      if @user.save(user_params)
      flash[:notice] = "Successfully created user"

        redirect_to user_path(@user)
      else
        flash[:alert] = "Could not create user"

        render :new
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def show
    if current_user
      define_user
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def edit
    define_user
  end

  def update
    if current_user
      define_user
      if @user.update(user_params)
        flash[:notice] = "Successfully updated user"

        redirect_to user_path(@user)
      else
        flash[:alert] = "Could not update user"

        render :edit
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def destroy
    if current_user
      define_user
      @user.destroy
      flash[:notice] = "Successfully deleted user"

      redirect_to root
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
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
