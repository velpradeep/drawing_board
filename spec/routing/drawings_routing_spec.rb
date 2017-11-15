require "rails_helper"

RSpec.describe "routes for Drawings", :type => :routing do

  context "/" do
    it "routes to the widgets controller" do
      expect(:get => "/").to route_to(:controller => "drawings", :action => "index")

    end
  end

  context "/drawings" do
    it "does not route to widgets" do
      expect(:get => "/drawings").not_to be_routable
    end

    it "does not route to widgets" do
      expect(:get => "/velpradeep").not_to be_routable
    end
  end

end
