require File.dirname(__FILE__) + '/../spec_helper'

describe SearchController do
  describe "routing" do
    it "recognizes and generates #search" do
      { :get => "/search" }.should route_to(:controller => "search", :action => "search")
    end
  end
end
