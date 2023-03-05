require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "POST /create" do
    it "creates a reservation" do
      user = create(:user)
      place = create(:place, host: user)
      sign_in user
      expect {
        post reservations_path, params: { reservation: { checkin: Date.today, checkout: Date.today + 1, guests: 1, place_id: place.id } }
      }.to change(Reservation, :count).by(1)
    end
  end
end
