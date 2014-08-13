class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    if @review
      redirect_to restaurant_path(@restaurant)
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
