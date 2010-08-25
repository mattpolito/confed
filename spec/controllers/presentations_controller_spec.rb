require 'spec_helper'

describe PresentationsController do

  describe "GET index" do
    it "should be successful" do
      pending
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    let(:presentation) { Factory(:presentation) }

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

end
