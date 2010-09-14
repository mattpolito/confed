require File.dirname(__FILE__) + '/../spec_helper'

describe PresentationsController do

  describe "GET index" do
    let(:presentations) { [mock_model(Presentation)] }

    before(:each) do
      Presentation.stub_chain(:order, :limit).and_return(presentations)
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

  describe "GET show" do
    let(:presentation) { mock_model(Presentation) }

    before(:each) do
      Presentation.should_receive(:find).with("37").and_return(presentation)
    end

    it "should be successful" do
      get :show, :id => "37"
      response.should be_success
    end

    it "should find presentation and assign for the view" do
      get :show, :id => "37"
      assigns[:presentation].should == presentation
    end
  end

  describe "GET search" do
    context "search query provided" do
      it "is successful" do
        get :search, :q => "foo"
        response.should be_success
      end

      it "searchs for presentations matching the query" do
        Presentation.should_receive(:search).with("foo")
        get :search, :q => "foo"
      end
    end

    context "no search query provided" do
      it "redirects back to the homepage" do
        get :search
        response.should redirect_to("/")
      end
    end
  end
end
