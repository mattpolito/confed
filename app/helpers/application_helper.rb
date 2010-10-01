module ApplicationHelper
  def active_class(path)
    URI.parse(request.path_info).path =~ /#{path}/ ? 'active' : nil
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
end