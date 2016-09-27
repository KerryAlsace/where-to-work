class PlacesController < ApplicationController

  def index
    if current_user
      @places = Place.all
      if current_user.shared_places 
        @shared_places = current_user.shared_places
      end
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def new
    @place = current_user.places.build
    @neighborhoods = Place.all.collect do |place|
      place.neighborhood
    end.uniq
    @place_types = Place.all.collect do |place|
      place.place_type
    end.uniq
    @things_available_for_purchase = Place.all.collect do |place|
      place.available_for_purchase
    end.uniq
  end

  def create
    if current_user
      @place = current_user.places.build(place_params)
      @place.creator_id = current_user.id

      if @place.save(place_params)
        flash[:notice] = "Successfully created place"

        redirect_to user_place_path(@place)
      else
        flash[:alert] = "Could not create place"
        flash[:notice] = @place.errors.full_messages

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

        redirect_to user_place_path(@place)
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

      redirect_to user_places_path
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
      params.require(:place).permit(:name, :type, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :available_for_purchase, :user_id, :friend_ids)
    end

end
