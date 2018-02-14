require "rails_helper"

RSpec.describe ReportsController, type: :routing do
  describe "routing" do

    it "routes to #by_category" do
      expect(:get => "/reports/by_category").to route_to("reports#by_category")
    end

    it "routes to #product_sold" do
      expect(:get => "/reports/product_sold").to route_to("reports#product_sold")
    end
  end
end
