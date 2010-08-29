require "spec_helper"

describe Admin::SpeakersController do
  describe "routing" do
    it "recognizes and generates #show" do
      { :get => "/admin/speakers/1" }.should route_to(:controller => "admin/speakers", :action => "show", :id => "1")
    end
  end
end
