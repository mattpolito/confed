require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::SpeakerRateController do
  describe "routing" do
    it 'recognizes and generates #speakers' do
      { :get => '/admin/speaker_rate/speakers/1-adam-walters' }.should route_to(:controller => 'admin/speaker_rate', :action => 'speakers', :id => '1-adam-walters')
    end

  end
end
