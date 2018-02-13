require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #by_category" do
    it "returns http success" do
      get :by_category
      expect(response).to have_http_status(:success)
    end
  end

end
