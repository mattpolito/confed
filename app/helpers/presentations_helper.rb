module PresentationsHelper
  def queue_button_for(presentation, user)
    return unless user_signed_in?
    if user && presentation.queued_by?(user)
      button_to('Watched', 
        save_presentation_path(presentation.event, presentation), 
          :method => :delete
      )
    else
      button_to('Watch Later', 
        save_presentation_path(presentation.event, presentation)
      )
    end
  end

  def shorten_url_for(url, presentation)
    unless presentation.short_url?
      presentation.set_short_url(url)
    else
      presentation.short_url
    end
  end

  def bitly_url(url)
    return 'http://bit.ly/foo' if Rails.env.test?
    bitly = Bitly.new(AppConfig.bitly.user, AppConfig.bitly.api_key)
    bitly.shorten(url).try(:short_url)
  rescue BitlyError => e
    logger.error "[Bitly]: #{e}"
    url
  end

  def tweet_text_for(presentation)
    speakers = presentation.speakers
    twitter_handles = speakers.collect do |s| 
      "@#{s.twitter}" if s.twitter?
    end.compact
    speaker_msg = "#{twitter_handles.join(" & ")} talk about " if twitter_handles.present?
    "Watching #{speaker_msg}#{presentation.title} - #{presentation.event.name}"
  end
end
