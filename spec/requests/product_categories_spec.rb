require 'rails_helper'

# TODO: test cases for rest fo the requests

RSpec.describe "ProductCategories", type: :request do
  let(:product) { create(:product) }
  describe "GET /products/:product_id/product_categories" do
    it "returns json response with http status 200" do
      get product_product_categories_path(product_id: product.id)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
