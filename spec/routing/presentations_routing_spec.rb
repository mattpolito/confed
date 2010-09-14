require "spec_helper"

describe PresentationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/presentations" }.should route_to(:controller => "presentations", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/presentations/1" }.should route_to(:controller => "presentations", :action => "show", :id => "1")
    end

    it "recognizes and generates #search" do
      { :get => "/presentations/search" }.should route_to(:controller => "presentations", :action => "search")
    end
  end
end
