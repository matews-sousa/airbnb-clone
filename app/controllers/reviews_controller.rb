class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :vote, :place_id)
  end
end
