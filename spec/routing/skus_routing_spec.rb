require "rails_helper"

RSpec.describe SkusController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products/1/skus").to route_to("skus#index", :product_id => "1")
    end


    it "routes to #show" do
      expect(:get => "/products/1/skus/1").to route_to("skus#show", :product_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/products/1/skus").to route_to("skus#create", :product_id => "1")
    end

    # it "routes to #update via PUT" do
    #   expect(:put => "/skus/1").to route_to("skus#update", :id => "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(:patch => "/skus/1").to route_to("skus#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   expect(:delete => "/skus/1").to route_to("skus#destroy", :id => "1")
    # end

  end
end
