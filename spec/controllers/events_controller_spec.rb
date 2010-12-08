require 'spec_helper'

describe EventsController do

  describe "GET show" do
    let(:event) { mock_model(Event) }
    
    it "succeeds" do
      Event.stub(:find).and_return(event)
      get :show, :id => "37"
    end

    it "finds event and assigns for the view" do
      Event.stub(:find).and_return(event)
      get :show, :id => "37"
      assigns[:event].should == event
    end
  end
end
