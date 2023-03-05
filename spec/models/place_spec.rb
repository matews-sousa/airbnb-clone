require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'instance methods' do
    describe '#first_available_date' do
      it 'returns the first available date' do
        user = create(:user)
        place = create(:place, host: user)
        reservation = Reservation.create!(
          checkin: Date.new(2017, 1, 1),
          checkout: Date.new(2017, 1, 6),
          guests: 1,
          place: place,
          user: user
        )
        expect(place.first_available_date).to eq(Date.new(2017, 1, 7))
      end
    end
  end
end
