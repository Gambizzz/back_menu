class RestaurantsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :authorize_admin!, only: [:update, :destroy]

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
    @restaurants = @restaurants.map do |restaurant|
      if restaurant.photo.attached?
        restaurant.as_json.merge(image_url: url_for(restaurant.photo))
      else
        restaurant.as_json
      end
    end

    render json: @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant.as_json.merge(image_url: url_for(@restaurant.photo))
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.admin_id = current_admin.id

    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      render json: @restaurant, status: :ok
    else
      render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    render json: { message: "Restaurant deleted successfully" }, status: :ok
  end

  private

  def authorize_admin!
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.admin_id == current_admin.id
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :food, :photo)
  end
end