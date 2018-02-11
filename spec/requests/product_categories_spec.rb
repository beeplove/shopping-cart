require 'rails_helper'

# TODO: test cases for rest fo the requests

RSpec.describe "ProductCategories", type: :request do
  describe "GET /product_categories" do
    it "returns json response with http status 200" do
      get product_categories_path

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
