require 'rails_helper'

RSpec.describe "Places", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/place/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/place/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/place/create"
      expect(response).to have_http_status(:success)
    end
  end

end
