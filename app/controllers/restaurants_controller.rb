class RestaurantsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    if params[:city].present? && params[:food].present?
      @restaurants = Restaurant.where(city: params[:city], food: params[:food])
    elsif params[:city].present?
      @restaurants = Restaurant.where(city: params[:city])
    elsif params[:food].present?
      @restaurants = Restaurant.where(food: params[:food])
    else
      @restaurants = Restaurant.all
    end

    render json: @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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
    params.require(:restaurant).permit(:name, :description, :admin_id, :city, :food)
  end
end








