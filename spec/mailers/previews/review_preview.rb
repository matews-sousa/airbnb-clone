# Preview all emails at http://localhost:3000/rails/mailers/review
class ReviewPreview < ActionMailer::Preview
  def review_created
    ReviewMailer.with(review: Review.first).review_created
  end
end
