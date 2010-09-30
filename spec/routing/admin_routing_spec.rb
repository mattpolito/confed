require "spec_helper"

describe AdminController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin" }.should route_to(:controller => "admin", :action => "index")
    end
  end
end
