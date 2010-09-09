require "spec_helper"

describe Admin::PresentationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin/presentations" }.should route_to(:controller => "admin/presentations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/presentations/new" }.should route_to(:controller => "admin/presentations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/presentations/1" }.should route_to(:controller => "admin/presentations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/presentations/1/edit" }.should route_to(:controller => "admin/presentations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/presentations" }.should route_to(:controller => "admin/presentations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/presentations/1" }.should route_to(:controller => "admin/presentations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/presentations/1" }.should route_to(:controller => "admin/presentations", :action => "destroy", :id => "1")
    end
  end
end
