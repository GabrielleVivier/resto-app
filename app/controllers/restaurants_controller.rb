class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.includes(:reviews).all
    @restaurants = @restaurants.sort_by { |restaurant| -restaurant.reviews.average(:rating)}
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :category)
  end


end
