require File.dirname(__FILE__) + '/../spec_helper'

describe TaggedController do
  describe "routing" do
    it "recognizes and generates #show" do
      { :get => "/tagged/yabba" }.should route_to(:controller => "tagged", :action => "show", :tag_name => 'yabba')
    end
  end
end
