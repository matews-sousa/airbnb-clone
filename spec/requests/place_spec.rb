require 'rails_helper'

RSpec.describe "Places", type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place) }

  before { sign_in user }

  describe "GET /places/:id" do
    context "passing valid place" do
      it "returns http success" do
        get place_path(place)
        expect(response).to have_http_status(:success)
      end
    end

    context "passing invalid place" do
      it "raise error record not found" do
        expect { get place_path("askdfjaksjha") }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "POST /places" do
    context "valid params" do
      it "successfully creates a Place" do
        expect do
          post "/places", params: {
            place: {
              name: "Name",
              headline: "Headline",
              description: "Description",
              price: 9.99,
              cleaning_fee: 9.99,
              max_guests: 2,
              rooms: 2,
              beds: 2,
              baths: 2,
              min_reservation_days: 7,
              address_1: "Address",
              city: "City",
              state: "State",
              country: "Country",
              latitude: 9.99,
              longitude: 9.99,
              host_id: user.id
            }
          }
        end.to change { Place.count }.by(1)
      end
    end
    
    context "invalid params" do
      it "fails at creating Place" do
        expect { post "/places", params: {
          place: {
            name: ""
          }
        } }.not_to change { Place.count }
      end
    end
  end
end
