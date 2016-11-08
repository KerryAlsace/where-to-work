class CommentsController < ApplicationController
  before_action :define_place

  def index
    @comments = @place.comments

    render :json => @comments
  end

  private
    def define_place
      @place = Place.find(params[:place_id])
    end
end
