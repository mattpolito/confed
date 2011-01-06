module ApplicationHelper
  include TweetButton

  TweetButton.default_tweet_button_options = {
    :via => 'getconfed'
  }

  def active_class(path)
    request.path =~ /#{path}/ ? 'active' : nil
  end
  
  def flash_messages
    content_tag(:div, :id => 'flash_messages') do
      output = ""
      flash.each do |type, msg|
        output += content_tag(:p, msg, :class => "message #{type.to_s}")
      end
      raw output
    end
  end

  def escaped_link(text, href, opts={})
    link_to CGI::escapeHTML(text), href, opts
  end

  def title(message)
    content_for(:title) { message }
  end

  def page_title
    content_for(:title).present? ? "#{content_for(:title)} - Confed" : "Confed" 
  end

  def avatar_url(user)
    if user.twitter.present?
      Twitter.profile_image(user.twitter, :size => 'bigger')
    else
      default_url = CGI.escape("#{root_url}images/default_avatar.png")
      user_email = user.email.try(:downcase) || ""
      gravatar_id = Digest::MD5.hexdigest(user_email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=73&d=#{default_url}"
    end
  end

  def link_to_tag(tag)
    link_to tag, tagged_path(tag.permalink)
  end
end
