class PlacesController < ApplicationController

  def add_comment
    define_place
    if @place.add_comment_to_place(params[:comment])
      flash[:notice] = "Comment has been added below"

      redirect_to user_place_path(current_user, @place)
    else
      flash[:alert] = "Could not add comment"

      redirect_to user_place_path(current_user, @place)
    end
  end

  def index
    if current_user && current_user.admin?
      @places = Place.all
    elsif current_user
      @places = current_user.places
    else
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    end
  end

  def new
    @place = current_user.places.build
    @possible_friends = possible_friends
    if params[:user_id].to_i != current_user.id

      redirect_to 'users/#{current_user.id}/places/new'
    end
  end

  def create
    if current_user
      @place = current_user.places.build(place_params)
      @place.creator_id = current_user.id
      @place.neighborhood = Neighborhood.find(params[:place][:neighborhood_id].to_i)
      if @place.save(place_params)
        flash[:notice] = "Successfully created place"

        redirect_to user_place_path(current_user, @place)
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
    define_place
    if !current_user
      flash[:alert] = "Must be logged in to do that"

      redirect_to login_path
    elsif !allowed_to_view_place?

      redirect_to 'users/#{current_user.id}/places/#{@place.id}'
    else
      shared_place = @place.current_user_shared_place(current_user)
      if shared_place.comment == nil || shared_place.comment == ""
        shared_place.comment = ""
        @comment = shared_place.comment
      else
        @current_comment = shared_place.comment
      end
    end
    if allowed_to_edit_place?
      @permitted_editor
    end
  end

  def edit
    define_place
    @possible_friends = possible_friends
    if params[:user_id].to_i != current_user.id

      redirect_to 'users/#{current_user.id}/places/@place.id/edit'
    end
  end

  def update
    define_place
    if !allowed_to_edit_place?
      flash[:alert] = "You're not allowed to edit this place"

      redirect_to login_path
    end
    friend_ids = params[:place][:friend_ids]
    friend_ids.each do |friend_id|
      if friend_id != "" && !@place.friends.include?(User.where(id: friend_id))
        SharedPlace.create(place_id: @place.id, friend_id: friend_id)
      end
    end
    if @place.update(place_params)
      flash[:notice] = "Successfully updated place"

      redirect_to user_place_path(@place)
    else
      flash[:alert] = "Could not update place"

      render :edit
    end
  end

  def destroy
    define_place
    if !allowed_to_edit_place?
      flash[:alert] = "You're not allowed to edit this place"

      redirect_to login_path
    end
    if @place.destroy
      flash[:notice] = "Successfully deleted place"

      redirect_to user_places_path
    else
      flash[:alert] = @place.errors.full_messages

      redirect_to user_place_path(current_user, @place)
    end
  end

  private
    def define_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :user_id, :friend_ids, :neighborhood_id, :creator_id)
    end

    def allowed_to_view_place?
      current_user && (current_user.admin? || (current_user.places_from_shared_places.include?(@place)) || (current_user == @place.creator))
    end

    def allowed_to_edit_place?
      current_user && (current_user.admin? || (current_user == @place.creator))
    end

    def possible_friends
      User.where.not(id: current_user.id)
    end

end