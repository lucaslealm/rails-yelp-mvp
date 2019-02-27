class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
