module PresentationsHelper
  def bitly_url(url)
    bitly = Bitly.new(AppConfig.bitly.user, AppConfig.bitly.api_key)
    bitly.shorten(url).try(:short_url)
  rescue BitlyError => e
    logger.error "[Bitly]: #{e}"
    url
  end

  def tweet_text_for(presentation)
    speakers = presentation.speakers
    twitter_handles = speakers.collect{ |s| "@#{s.twitter}" if s.twitter? }.compact
    speaker_msg = "#{twitter_handles.join(" & ")} talk about " if twitter_handles.present?
    "Watching #{speaker_msg}#{presentation.title} - #{presentation.event.name}"
  end
end
