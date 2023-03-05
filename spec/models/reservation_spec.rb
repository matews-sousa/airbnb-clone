require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'instance methods' do
    describe '#total_nights' do
      it 'returns the number of nights stayed' do
        reservation = Reservation.new(checkin: Date.new(2017, 1, 1), checkout: Date.new(2017, 1, 6))
        expect(reservation.total_nights).to eq(5)
      end
    end

    describe '#total_price' do
      it 'returns the total price for the reservation' do
        place = Place.new(price: 40, cleaning_fee: 20)
        reservation = Reservation.new(checkin: Date.new(2017, 1, 1), checkout: Date.new(2017, 1, 6), place: place)
        expect(reservation.total_price).to eq(220)
      end
    end
  end
end
