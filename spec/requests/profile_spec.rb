require 'rails_helper'

RSpec.describe "Profiles", type: :request do 
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /profile/places" do
    it "returns http success" do
      get my_places_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /profile/places/new" do
    context "when user is not logged in" do
      it "redirects to root path" do
        get new_place_path
        expect(response).to redirect_to(root_path)
      end
    end
    
    context "when user is logged in" do
      context "when user is not a host" do
        it "redirects to root path" do
          get new_place_path
          expect(response).to redirect_to(root_path)
        end
      end

      context "when user is a host" do
        it "returns http success" do
          sign_out user
          host = create(:user, :host)
          sign_in host

          get new_place_path
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  describe "GET /profile/favorites" do
    it "returns http success" do
      get my_favorites_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /profile/reservations" do
    it "returns http success" do
      get my_reservations_path
      expect(response).to have_http_status(200)
    end
  end
end
