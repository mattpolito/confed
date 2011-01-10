require 'spec_helper'

describe EventsController do

  describe "GET index" do
    let(:event) { mock_model(Event, :name => "Event Name") }

    before do
      Event.stub(:paginate).and_return([event])
    end

    it "succeeds" do
      get :index
      response.should be_success
    end

    it "finds events and assigns for the view" do
      get :index
      assigns[:events].should == [event]
    end
    
    it "renders the correct template" do
      get :index
      response.should render_template(:index)
    end
  end
  
  describe "GET show" do
    let(:event) { mock_model(Event, :name => "Event Name") }
    let(:presentation) { mock_model(Presentation, :created_at => '') }

    before do
      Event.stub_chain(:includes, :find).and_return(event)
    end

    it "finds event and assigns for the view" do
      get :show, :id => "37"
      assigns[:event].should == event
    end
    
    describe "with HTML" do
      it "succeeds" do
        get :show, :id => "37"
        response.should be_success
      end

      it "renders the correct template" do
        get :show, :id => "37"
        response.should render_template(:show)
      end
    end
    
    describe "with RSS" do
      it "should be redirect" do
        get :show, :id => "37", :format => :rss
        response.should be_redirect
      end

      it "returns a moved permanently response code" do
        get :show, :id => "37", :format => :rss
        response.status.should == 301
        response.status_message.should == "Moved Permanently"
      end
    end

    describe "with ATOM" do
      before do
        event.stub_chain(:presentations, :released).and_return([presentation])
      end

      it "succeeds" do
        get :show, :id => "37", :format => :atom
        response.should be_success
      end
    end
  end
end
