require File.dirname(__FILE__) + '/../spec_helper'

describe SpeakerRate do

  describe 'get_speaker' do

    let(:speakerrate_url){ 'http://speakerrate.com/speakers/1-adam-walters' }

    context 'successful call' do

      let(:mock_response){ mock(:code => 200) }

      it 'requests JSON data from the speakerrate API' do
        HTTParty.should_receive(:get).with("#{speakerrate_url}.json").and_return(mock_response)
        SpeakerRate.get_speaker(speakerrate_url)
      end

      it 'returns the response if the call was successful (200)' do
        HTTParty.should_receive(:get).with("#{speakerrate_url}.json").and_return(mock_response)
        SpeakerRate.get_speaker(speakerrate_url).should == mock_response
      end
    end

    it 'raises a SpeakerRate::SpeakerNotFound error if status is not 200' do
      [404, 302].each do |status|
        mock_response = mock(:code => status)
        HTTParty.stub!(:get => mock_response)
        lambda { 
          SpeakerRate.get_speaker(speakerrate_url)
        }.should raise_error(SpeakerRate::Errors::SpeakerNotFound)
      end
    end
  end

end
