require "spec_helper"

describe EventsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/events" }.should route_to(:controller => "events", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/events/1" }.should route_to(:controller => "events", :action => "show", :id => "1")
    end

    it "recognizes and generates #show.rss" do
      { :get => "/events/1.rss" }.should route_to(:controller => "events", :action => "show", :id => "1", :format => "rss")
    end

    it "recognizes and generates #show.atom" do
      { :get => "/events/1.atom" }.should route_to(:controller => "events", :action => "show", :id => "1", :format => "atom")
    end
  end
end
