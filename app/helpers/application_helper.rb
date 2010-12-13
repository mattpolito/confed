module ApplicationHelper
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
    if message
      content_for :title do
        message
      end
    end
  end

  def avatar_url(user)
    if user.twitter.present?
      Twitter.profile_image(user.twitter, :size => 'bigger')
    else
      default_url = CGI.escape("#{root_url}images/default_avatar.png")
      gravatar_id = Digest::MD5.hexdigest(user.email.try(:downcase))
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=73&d=#{default_url}"
    end
  end
end
