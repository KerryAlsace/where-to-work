class PlacesController < ApplicationController

  def index
    if current_user
      @places = Place.all
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def new
    @place = Place.new
  end

  def create
    if current_user
      @place = Place.new
      if @place.save(place_params)
        flash[:notice] = "Successfully created place"

        redirect_to place_path(@place)
      else
        flash[:alert] = "Could not create place"

        render :new
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def show
    if current_user
      define_place
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def edit
    define_place
  end

  def update
    if current_user
      define_place
      if @place.update(place_params)
        flash[:notice] = "Successfully updated place"

        redirect_to place_path(@place)
      else
        flash[:alert] = "Could not update place"

        render :edit
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def destroy
    if current_user
      define_place
      @place.destroy
      flash[:notice] = "Successfully deleted place"

      redirect_to places_path
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  private
    def define_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :type, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :available_for_purchase, :user_id)
    end

end
