require 'rails_helper'

# TODO: test cases for rest fo the requests

RSpec.describe "Lineitems", type: :request do
  let(:order) { create(:order) }

  describe "GET /customers/:customer_id/orders/:order_id/lineitems" do
    it "returns json response with http status 200" do
      get customer_order_lineitems_path(:customer_id => order.customer.id, :order_id => order.id)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
