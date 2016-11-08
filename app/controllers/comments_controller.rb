class CommentsController < ApplicationController
  before_action :set_place

  def index
    @comments = @place.comments

    # render :layout => false
    render :json => @comments
  end

  private
    def define_place
      @place = Place.find(params[:place_id])
    end
end
