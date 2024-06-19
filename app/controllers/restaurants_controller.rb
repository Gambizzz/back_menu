class RestaurantsController < ApplicationController
  before_action :authenticate_admin! 

  def index
    @restaurants = current_admin.restaurants
    render json: @restaurants
  end

  def show
    @restaurant = current_admin.restaurants.find(params[:id])
    render json: @restaurant
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.admin_id = current_admin.id

    if restaurant.save
      render json: restaurant, status: :created
    else
      render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :admin_id)
  end
end





