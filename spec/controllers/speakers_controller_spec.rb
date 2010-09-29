require 'spec_helper'

describe SpeakersController do

  def mock_speaker(stubs={})
    @mock_speaker ||= mock_model(Speaker, stubs).as_null_object
  end

  describe "GET index" do
    let(:speakers) { [mock_speaker] }

    before do
      Speaker.stub_chain(:order, :limit).and_return(speakers)
    end

    it "succeeds" do
      get :index
      response.should be_success
    end

    it "finds speakers and assigns for the view" do
      get :index
      assigns[:speakers].should == speakers
    end
  end

  describe "GET show" do
    it "assigns the requested speaker as @speaker" do
      Speaker.stub(:find).with("37") { mock_speaker }
      get :show, :id => "37"
      assigns(:speaker).should be(mock_speaker)
    end
  end

end
