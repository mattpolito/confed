class SpeakerRate

  module Errors
    SpeakerNotFound = Class.new(StandardError)
  end

  def self.get_speaker(speakerrate_url)
    HTTParty.get("#{speakerrate_url}.json").tap do |response|
      raise Errors::SpeakerNotFound unless response.code == 200
    end
  end
end
