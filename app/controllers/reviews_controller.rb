class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.create(review_params)
    @review.user = current_user
    redirect_to @place
  end

  private

  def review_params
    params.require(:review).permit(:content, :vote)
  end
end
