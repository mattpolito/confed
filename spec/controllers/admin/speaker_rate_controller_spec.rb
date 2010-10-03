require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::SpeakerRateController do
  let(:user) { mock_model(User) }

  before do
    User.stub(:find).and_return(user)
    sign_in user
  end

  describe "GET #speakers" do
    it "calls SpeakerRate.get_speaker with SpeakerRate Id" do
      speaker_rate_id = '1-adam'
      SpeakerRate.should_receive(:get_speaker).with(speaker_rate_id)
      xhr :get, :speakers, :id => speaker_rate_id
    end
  end
end
