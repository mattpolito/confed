class SpeakerRate

  VALID_SPEAKER_URL_FORMAT = /http:\/\/speakerrate.com\/speakers\/\d+-[a-z-]+$/

  module Errors
    SpeakerNotFound = Class.new(StandardError)
    InvalidUrl = Class.new(StandardError)
  end

  def self.get_speaker(speaker_rate_id)
    speaker_rate_url = "http://speakerrate.com/speakers/#{speaker_rate_id}"
    raise Errors::InvalidUrl unless VALID_SPEAKER_URL_FORMAT =~ speaker_rate_url
    response = HTTParty.get("#{speaker_rate_url}.json")
    raise Errors::SpeakerNotFound unless response.code == 200

    response
  end
end
