class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    if @place.save(place_params)
      flash[:notice] = "Successfully created place"

      redirect_to place_path(@place)
    else
      flash[:alert] = "Could not create place"

      render :new
    end
  end

  def show
    define_place
  end

  def edit
    define_place
  end

  def update
    define_place
    if @place.update(place_params)
      flash[:notice] = "Successfully updated place"

      redirect_to place_path(@place)
    else
      flash[:alert] = "Could not update place"

      render :edit
    end
  end

  def destroy
    define_place
    @place.destroy

    redirect_to places_path
  end

  private
    def define_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :type, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :available_for_purchase, :user_id)
    end

end
