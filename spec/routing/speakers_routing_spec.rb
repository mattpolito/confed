require "spec_helper"

describe SpeakersController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/speakers" }.should route_to(:controller => "speakers", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/speakers/new" }.should route_to(:controller => "speakers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/speakers/1" }.should route_to(:controller => "speakers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/speakers/1/edit" }.should route_to(:controller => "speakers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/speakers" }.should route_to(:controller => "speakers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/speakers/1" }.should route_to(:controller => "speakers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/speakers/1" }.should route_to(:controller => "speakers", :action => "destroy", :id => "1")
    end

  end
end
