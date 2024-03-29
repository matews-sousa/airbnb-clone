class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("add_review", partial: "reviews/form", locals: { place: @review.place, review: Review.new }),
            turbo_stream.update("reviews_title", partial: "reviews/reviews_title", locals: { place: @review.place }),
            turbo_stream.prepend("reviews",
              partial: "reviews/review",  locals: { review: @review })
          ]
        end
        ReviewMailer.with(review: @review).review_created.deliver_later
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("add_review", partial: "reviews/form", locals: { place: @review.place, review: @review })
        end
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :vote, :place_id)
  end
end
