require "spec_helper"

describe Admin::EventsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/events" }.should route_to(:controller => "admin/events", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/events/new" }.should route_to(:controller => "admin/events", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/events/1" }.should route_to(:controller => "admin/events", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/events/1/edit" }.should route_to(:controller => "admin/events", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/events" }.should route_to(:controller => "admin/events", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/events/1" }.should route_to(:controller => "admin/events", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/events/1" }.should route_to(:controller => "admin/events", :action => "destroy", :id => "1")
    end

  end
end
