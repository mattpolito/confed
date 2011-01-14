module PresentationsHelper
  def bitly_url(url)
    #TODO extract api key into some kind of config yaml
    #TODO catch the bitly error and return request.url and log to hoptoad
    bitly = Bitly.new('getconfed', 'R_372daf4c1d897ad639f2c96062c49fd0')
    bitly.shorten(url).try(:short_url)
  end

  def tweet_text_for(presentation)
    speakers = presentation.speakers
    twitter_handles = speakers.collect{ |s| "@#{s.twitter}" if s.twitter? }.compact
    speaker_msg = "#{twitter_handles.join(" & ")} talk about " if twitter_handles.present?
    "Watching #{speaker_msg}#{presentation.title} - #{presentation.event.name}"
  end
end
