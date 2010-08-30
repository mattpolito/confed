require "spec_helper"

describe Admin::SpeakersController do
  describe "routing" do
    it "recognizes and generates admin #index" do
      { :get => "/admin/speakers" }.should route_to(:controller => "admin/speakers", :action => "index")
    end

    it "recognizes and generates admin #new" do
      { :get => "/admin/speakers/new" }.should route_to(:controller => "admin/speakers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/speakers/1" }.should route_to(:controller => "admin/speakers", :action => "show", :id => "1")
    end
  end
end
