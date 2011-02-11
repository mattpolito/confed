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

  def meta_content_for(section)
    key = ("meta_" + section.to_s).to_sym
    content_for(key) { Proc.new.call }
  end

  def displayed_meta_description
    if content_for(:meta_description).present?
      truncate(
        content_for(:meta_description), 
          :length => 155, :separator => ' '
      ).strip
    else
      AppConfig.default_meta_description
    end
  end

  def displayed_meta_keywords
    if content_for(:meta_keywords).present?
      content_for(:meta_keywords).strip
    else
      AppConfig.default_meta_keywords
    end
  end

  def displayed_page_title
    if content_for(:meta_title).present? 
      "#{content_for(:meta_title).strip} - Confed"
    else
      AppConfig.default_page_title
    end
  end

  def avatar_url(user)
    default_image_path = "#{root_url}images/default_avatar.png"
    if user.twitter?
      Twitter.profile_image(user.twitter, :size => 'bigger')
    else
      default_url = CGI.escape(default_image_path)
      user_email = user.email.try(:downcase) || ""
      gravatar_id = Digest::MD5.hexdigest(user_email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=73&d=#{default_url}"
    end
  rescue 
    default_image_path
  end

  def link_to_tag(tag)
    link_to tag, tagged_path(tag.permalink)
  end
end
