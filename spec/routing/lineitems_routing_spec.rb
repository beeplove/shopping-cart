require "rails_helper"

RSpec.describe LineitemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/customers/1/orders/1/lineitems").to \
        route_to("lineitems#index", :customer_id => "1", :order_id => "1")
    end


    it "routes to #show" do
      expect(:get => "/customers/1/orders/1/lineitems/1").to \
        route_to("lineitems#show", :customer_id => "1", :order_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/customers/1/orders/1/lineitems").to \
        route_to("lineitems#create", :customer_id => "1", :order_id => "1")
    end

    # it "routes to #update via PUT" do
    #   expect(:put => "/lineitems/1").to route_to("lineitems#update", :id => "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(:patch => "/lineitems/1").to route_to("lineitems#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   expect(:delete => "/lineitems/1").to route_to("lineitems#destroy", :id => "1")
    # end

  end
end
