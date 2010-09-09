module ApplicationHelper
  def flash_messages
    output = ""
    output += content_tag(:div, :id => 'flash_messages') do
      flash.each do |type, msg|
        output += content_tag(:p, msg, :class => "message #{type.to_s}")
      end
      output
    end
    raw output
  end

end
