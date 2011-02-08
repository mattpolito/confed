require File.dirname(__FILE__) + '/../spec_helper'

describe PresentationsController do

  describe "GET index" do
    let(:presentations) { [mock_model(Presentation, :created_at => Time.now)] }

    describe "with HTML" do
      before(:each) do
        Presentation.stub_chain(:released, :order, :paginate).and_return(presentations)
      end

      it "should be successful" do
        get :index
        response.should be_success
      end

      it "should find presentations and assign for the view" do
        get :index
        assigns[:presentations].should == presentations
      end

      it "renders the correct template" do
        get :index
        response.should render_template(:index)
      end
    end

    describe "with ATOM" do
      before(:each) do
        Presentation.stub_chain(:released, :order).and_return(presentations)
      end

      it "should be successful" do
        get :index, :format => :atom
        response.should be_success
      end

      it "should find presentations and assign for the view" do
        get :index, :format => :atom
        assigns[:presentations].should == presentations
      end
    end
    
    describe "with RSS" do
      it "should be redirect" do
        get :index, :format => :rss
        response.should be_redirect
      end

      it "returns a moved permanently response code" do
        get :index, :format => :rss
        response.status.should == 301
        response.status_message.should == "Moved Permanently"
      end
    end
  end

  describe "GET show" do
    let(:presentation) { mock_model(Presentation) }
    let(:event) { mock_model(Event) }

    before(:each) do
      Event.stub(:find).and_return(event)
      event.stub_chain(:presentations, :released, :order, :find).with("37").
        and_return(presentation)
    end

    it "should be successful" do
      get :show, :id => "37", :event_id => "event-name"
      response.should be_success
    end

    it "should find presentation and assign for the view" do
      get :show, :id => "37", :event_id => "event-name"
      assigns[:presentation].should == presentation
    end

    it "renders the correct template" do
      get :show, :id => "37", :event_id => "event-name"
      response.should render_template(:show)
    end
  end

end
