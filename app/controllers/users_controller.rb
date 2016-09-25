class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save(user_params)
    flash[:notice] = "Successfully created user"

      redirect_to user_path(@user)
    else
      flash[:alert] = "Could not create user"

      render :new
    end
  end

  def show
    define_user
  end

  def edit
    define_user
  end

  def update
    define_user
    if @user.update(user_params)
      flash[:notice] = "Successfully updated user"

      redirect_to user_path(@user)
    else
      flash[:alert] = "Could not update user"

      render :edit
    end
  end

  def destroy
    define_user
    @user.destroy

    redirect_to root
  end

  private
    def define_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
