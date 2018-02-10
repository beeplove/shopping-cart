require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "returns json response with http status 200" do
      get products_path

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
