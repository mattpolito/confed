require File.dirname(__FILE__) + '/../spec_helper'

describe SitemapController do
  describe "routing" do
    it "recognizes and generates #show.xml" do
      pending "I don't really care that the route is set explicitly to a :get"
      { :get => "/sitemap.xml" }.should route_to(:controller => "sitemap", :action => "show", :format => "xml")
    end
  end
end

