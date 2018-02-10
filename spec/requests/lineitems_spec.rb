require 'rails_helper'

RSpec.describe "Lineitems", type: :request do
  describe "GET /lineitems" do
    it "works! (now write some real specs)" do
      get lineitems_path
      expect(response).to have_http_status(200)
    end
  end
end
