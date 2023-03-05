require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place) }
  
  before { sign_in user }

  describe "POST /favorites" do
    context "user is signed in" do
      it "creates a favorite" do
        expect {
          post favorites_path(format: :turbo_stream), params: { favorite: { place_id: place.id } }
        }.to change(Favorite, :count).by(1)
      end
    end

    context "user is not signed in" do
      it "does not create a favorite" do
        sign_out user
        expect { 
          post favorites_path, params: { favorite: { place_id: place.id } }
        }.to change(Favorite, :count).by(0)
      end
    end
  end

  describe "DELETE /favorites/:id" do
    let!(:favorite) { create(:favorite, user: user, place: place) }

    it "deletes a favorite" do
      expect {
        delete favorite_path(favorite, format: :turbo_stream)
      }.to change(Favorite, :count).by(-1)
    end
  end
end