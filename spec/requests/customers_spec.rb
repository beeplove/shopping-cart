require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "returns json resonse with http status 200" do
      get "/customers"

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "POST /customers" do
    it "returns json response with http status 200" do
      post "/customers", params: { customer: { first_name: "John" } }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "GET /customers/:id" do
    let(:customer_id) { create(:customer).id }

    it "returns json response with http status 200" do
      get "/customers/#{customer_id}"

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")
    end
  end
end
