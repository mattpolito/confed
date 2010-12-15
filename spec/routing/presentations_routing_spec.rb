require "spec_helper"

describe PresentationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/presentations" }.should route_to(:controller => "presentations", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "events/event-name/presentations/presentation-name" }.
        should route_to(:controller => "presentations", 
                        :action => "show", 
                        :id => 'presentation-name',
                        :event_id => 'event-name')
    end

  end
end
