require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'class methods' do
    it 'should return the average vote' do
      user = FactoryBot.create(:user)
      place = FactoryBot.create(:place)

      review1 = FactoryBot.create(:review, vote: 1, place: place, user: user)
      review2 = FactoryBot.create(:review, vote: 5, place: place, user: user)
      review3 = FactoryBot.create(:review, vote: 3, place: place, user: user)

      expect(place.average_vote).to eq(3)
    end
  end
end
