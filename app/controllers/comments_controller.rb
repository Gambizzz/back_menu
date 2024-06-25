class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_restaurant, only: %i[index create destroy]
  before_action :set_comment, only: %i[destroy]

  def index
    comments = @restaurant.comments.includes(:user).order(created_at: :desc)
    render json: comments.map { |comment| { id: comment.id, email: comment.user.email, body: comment.body } }
  end

  def create
    @comment = @restaurant.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      render json: { message: "Comment deleted successfully" }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_comment
    @comment = @restaurant.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

