module PresentationsHelper
  def shorten_url_for(url, presentation)
    unless presentation.short_url?
      presentation.set_short_url(url)
    else
      presentation.short_url
    end
  end

  def tweet_text_for(presentation)
    speakers = presentation.speakers
    twitter_handles = speakers.collect{ |s| "@#{s.twitter}" if s.twitter? }.compact
    speaker_msg = "#{twitter_handles.join(" & ")} talk about " if twitter_handles.present?
    "Watching #{speaker_msg}#{presentation.title} - #{presentation.event.name}"
  end
end
