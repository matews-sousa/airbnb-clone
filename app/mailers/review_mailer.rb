class ReviewMailer < ApplicationMailer
  def review_created
    @review = params[:review]
    @host = @review.place.host
    mail(to: @host.email, subject: "A review has been created for your place!")
  end
end
