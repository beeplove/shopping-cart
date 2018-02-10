require "rails_helper"

RSpec.describe LineitemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lineitems").to route_to("lineitems#index")
    end


    it "routes to #show" do
      expect(:get => "/lineitems/1").to route_to("lineitems#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/lineitems").to route_to("lineitems#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lineitems/1").to route_to("lineitems#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lineitems/1").to route_to("lineitems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lineitems/1").to route_to("lineitems#destroy", :id => "1")
    end

  end
end
