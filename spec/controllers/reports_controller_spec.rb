require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #by_category" do
    it "returns http success" do
      get :by_category
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #product_sold" do
    it "returns success response for happy scenario" do
      get :product_sold
      expect(response).to have_http_status(:success)
    end

    it "returns with error response when start_date is invalid" do
      get :product_sold, params: {start_date: "YYYY-MM-DD"}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
