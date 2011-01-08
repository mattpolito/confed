module PresentationsHelper
  def tweet_text_for(presentation)
    speakers = presentation.speakers
    twitter_handles = speakers.collect{ |s| "@#{s.twitter}" if s.twitter? }.compact
    speaker_msg = "#{twitter_handles.join(" & ")} talk about " if twitter_handles.present?
    "Watching #{speaker_msg}#{presentation.title} - #{presentation.event.name}"
  end
end
