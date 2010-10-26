class Embedly
  DEFAULT_MAX_WIDTH = 592
  def self.get_attrs(url, options = {})
    max_width = options[:max_width] || DEFAULT_MAX_WIDTH
    embedly_url = "http://api.embed.ly/v1/api/oembed?url=#{url}&maxwidth=#{max_width}"
    response = HTTParty.get embedly_url
    response.parsed_response
  rescue
    {}
  end  
end
