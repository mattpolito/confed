require File.dirname(__FILE__) + '/../spec_helper'

describe PresentationsController do

  describe "GET index" do
    let(:presentations) { [mock_model(Presentation, :created_at => Time.now)] }

    describe "with HTML" do
      before(:each) do
        Presentation.stub_chain(:released, :paginate).and_return(presentations)
      end

      it "should be successful" do
        get :index
        response.should be_success
      end

      it "should find presentations and assign for the view" do
        get :index
        assigns[:presentations].should == presentations
      end
    end

    describe "with ATOM" do
      before(:each) do
        Presentation.stub(:released).and_return(presentations)
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

    before(:each) do
      Presentation.stub_chain(:released, :find).
        with("37", :scope => "event-name").
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
  end

end
