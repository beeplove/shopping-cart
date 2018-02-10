require 'rails_helper'

RSpec.describe "Skus", type: :request do
  describe "GET /skus" do
    it "returns json response with http status 200" do
      get skus_path

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
