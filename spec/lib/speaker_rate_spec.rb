require File.dirname(__FILE__) + '/../spec_helper'

describe SpeakerRate do

  describe 'get_speaker' do

    let(:speaker_rate_id){ '1-adam-walters' }
    let(:speaker_rate_url){ 'http://speakerrate.com/speakers/1-adam-walters' }

    context 'successful call' do

      let(:mock_response){ mock(:code => 200) }

      it 'requests JSON data from the speakerrate API' do
        HTTParty.should_receive(:get).with("#{speaker_rate_url}.json").and_return(mock_response)
        SpeakerRate.get_speaker(speaker_rate_id)
      end

      it 'returns the response if the call was successful (200)' do
        HTTParty.should_receive(:get).with("#{speaker_rate_url}.json").and_return(mock_response)
        SpeakerRate.get_speaker(speaker_rate_id).should == mock_response
      end
    end

    it 'raises a SpeakerRate::InvalidUrl if the url is invalid' do
      invalid_id = 'foo'
      lambda { 
        SpeakerRate.get_speaker(invalid_id)
      }.should raise_error(SpeakerRate::Errors::InvalidUrl)
    end

    it 'raises a SpeakerRate::SpeakerNotFound error if status is not 200' do
      [404, 302].each do |status|
        mock_response = mock(:code => status)
        HTTParty.stub!(:get => mock_response)
        lambda { 
          SpeakerRate.get_speaker(speaker_rate_id)
        }.should raise_error(SpeakerRate::Errors::SpeakerNotFound)
      end
    end
  end

end
