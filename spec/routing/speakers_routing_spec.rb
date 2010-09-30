require "spec_helper"

describe SpeakersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/speakers" }.should route_to(:controller => "speakers", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/speakers/1" }.should route_to(:controller => "speakers", :action => "show", :id => "1")
    end
  end
end
