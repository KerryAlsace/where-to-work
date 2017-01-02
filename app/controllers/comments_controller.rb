class CommentsController < ApplicationController
  before_action :define_place

  def index
    @comments = @place.comments

    render json: @comments
  end

  def create
    @comment = @place.comments.build(comments_params)
    if @comment.save
      render json: @comment
    else
      redirect_to "posts/show"
    end
  end

  private
    def define_place
      @place = Place.find(params[:place_id])
    end

    def comments_params
      params.require(:comment).permit(:body)
    end
end
