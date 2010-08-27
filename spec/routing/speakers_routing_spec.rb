require "spec_helper"

describe Admin::SpeakersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin/speakers" }.should route_to(:controller => "admin/speakers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/speakers/new" }.should route_to(:controller => "admin/speakers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/speakers/1" }.should route_to(:controller => "admin/speakers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/speakers/1/edit" }.should route_to(:controller => "admin/speakers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/speakers" }.should route_to(:controller => "admin/speakers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/speakers/1" }.should route_to(:controller => "admin/speakers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/speakers/1" }.should route_to(:controller => "admin/speakers", :action => "destroy", :id => "1")
    end
  end
end
