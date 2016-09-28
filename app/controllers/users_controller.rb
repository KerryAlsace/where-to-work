class UsersController < ApplicationController

  def index
    if current_user.admin?
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
    @user = User.new
    if @user.save(user_params)
    flash[:notice] = "Successfully created user"

      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages

      render :new
    end
  end

  def show
    if current_user.admin?
      define_user
    else
      flash[:alert] = "Must be an admin to do that"

      redirect_to root_path
    end
  end

  def edit
    if current_user && params[:user_id]
      @user = User.find(params[:user_id])
    elsif current_user
      define_user
    else
      flash[:alert] = "You must be logged in to do that"

      redirect_to root_path
    end
  end

  def update
    if current_user && params[:user_id]
      @user = User.find(params[:user_id])
    elsif current_user
      define_user
      if @user.update(user_params)
        flash[:notice] = "Successfully updated user"

        redirect_to user_path(@user)
      else
        flash[:alert] = @user.errors.full_messages

        render :edit
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def destroy
    if current_user && params[:user_id]
      @user = User.find(params[:user_id])
    elsif current_user
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
      params.require(:user).permit(:username, :password, :password_confirmation, :role, :user_id, places_attributes: {"name"=>"New Place", "neighborhood_id"=>"5", "address"=>"sdf", "comments"=>"", "wifi"=>"0", "wifi_quality"=>"", "public_restroom"=>"0", "restroom_cleanliness"=>"", "costs_money"=>"1", "friend_ids"=>["", "3", "7"]})
    end

end

# params["user"]["places_attributes"]["0"]
# <ActionController::Parameters {"name"=>"New Place", "neighborhood_id"=>"5", "address"=>"12345", "comments"=>"", "wifi"=>"1", "wifi_quality"=>"1", "public_restroom"=>"0", "restroom_cleanliness"=>"", "costs_money"=>"0", "friend_ids"=>["", "4", "5"]} permitted: false>

# params.require(:user).permit(:username, :password, :password_confirmation, :role, places_attributes: [{:id, :name, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :user_id, :friend_ids, :neighborhood_id, :creator_id}])

# params.require(:user).permit(:username, :password, :password_confirmation, :role, places_attributes: [{"id", "name", "neighborhood", "address", "comments", "wifi", "wifi_quality", "public_restroom", "restroom_cleanliness", "costs_money", "user_id", "friend_ids", "neighborhood_id", "creator_id"}])

# params.require(:user).permit(:username, :password, :password_confirmation, :role, :user_id, {:places_attributes => {:id, :name, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :user_id, :neighborhood_id, :creator_id, :friend_ids => []}})