require "rails_helper"

RSpec.describe ProductCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products/1/product_categories").to route_to("product_categories#index", :product_id => "1")
    end


    it "routes to #show" do
      expect(:get => "/products/1/product_categories/1").to route_to("product_categories#show", :product_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/products/1/product_categories").to route_to("product_categories#create", :product_id => "1")
    end

    # it "routes to #update via PUT" do
    #   expect(:put => "/product_categories/1").to route_to("product_categories#update", :id => "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(:patch => "/product_categories/1").to route_to("product_categories#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   expect(:delete => "/product_categories/1").to route_to("product_categories#destroy", :id => "1")
    # end

  end
end
