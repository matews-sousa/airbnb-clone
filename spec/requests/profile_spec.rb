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
    it "returns http success" do
      get new_place_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /profile/favorites" do
    it "returns http success" do
      get my_favorites_path
      expect(response).to have_http_status(200)
    end
  end
end
