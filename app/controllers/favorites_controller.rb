class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.includes(:restaurant)
    render json: @favorites, include: :restaurant
  end

  def create
    @favorite = current_user.favorites.new(favorite_params)
    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    if @favorite
      @favorite.destroy
      render json: { message: "Favorite deleted successfully" }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:restaurant_id)
  end
end

