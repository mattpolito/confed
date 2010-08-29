require 'spec_helper'

describe SpeakersController do

  def mock_speaker(stubs={})
    @mock_speaker ||= mock_model(Speaker, stubs).as_null_object
  end

  describe "GET show" do
    it "assigns the requested speaker as @speaker" do
      Speaker.stub(:find).with("37") { mock_speaker }
      get :show, :id => "37"
      assigns(:speaker).should be(mock_speaker)
    end
  end

end
