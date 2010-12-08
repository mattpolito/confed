require "spec_helper"

describe EventsController do
  describe "routing" do
    it "recognizes and generates #show" do
      { :get => "/events/1" }.should route_to(:controller => "events", :action => "show", :id => "1")
    end
  end
end
