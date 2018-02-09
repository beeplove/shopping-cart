require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:customer) { create(:customer) }

  describe "GET /customers/:customer_id/orders" do
    it "returns json resonse with http status 200" do
      get customer_orders_path(:customer_id => customer.id)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
