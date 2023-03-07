require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "POST /reviews" do
    it "creates a new review" do
      user = FactoryBot.create(:user)
      place = FactoryBot.create(:place)
      
      sign_in user

      expect {
        post reviews_path, params: { review: { content: "This is a review", vote: 5, place_id: place.id } } 
      }.to change(Review, :count).by(1)
    end
  end
end
