require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'instance methods' do
    describe '#average_vote' do
      it 'should return the average vote' do
        user = FactoryBot.create(:user)
        place = FactoryBot.create(:place)
  
        review1 = FactoryBot.create(:review, vote: 1, place: place, user: user)
        review2 = FactoryBot.create(:review, vote: 5, place: place, user: user)
        review3 = FactoryBot.create(:review, vote: 3, place: place, user: user)
  
        expect(place.average_vote).to eq(3)
      end
    end

    describe '#first_available_date' do
      context 'when there are no reservations' do
        it 'returns the todays date' do
          user = create(:user)
          place = create(:place, host: user)
          expect(place.first_available_date).to eq(Date.today)
        end
      end

      context 'when there are reservations with pending status' do
        it 'returns the todays date' do
          user = create(:user)
          place = create(:place, host: user)
          reservation = Reservation.create!(
            checkin: Date.new(2017, 1, 1),
            checkout: Date.new(2017, 1, 6),
            guests: 1,
            status: :pending,
            place: place,
            user: user
          )
          expect(place.first_available_date).to eq(Date.today)
        end
      end

      context 'when there are reservations with paid status' do
        it 'returns the first available date' do
          user = create(:user)
          place = create(:place, host: user)
          reservation = Reservation.create!(
            checkin: Date.new(2017, 1, 1),
            checkout: Date.new(2017, 1, 6),
            guests: 1,
            status: :paid,
            place: place,
            user: user
          )
          expect(place.first_available_date).to eq(Date.new(2017, 1, 7))
        end
      end
    end
  end
end
