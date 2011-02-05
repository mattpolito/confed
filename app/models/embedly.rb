class Embedly
  DEFAULT_MAX_WIDTH = 592
  EMBEDLY_URL = "http://api.embed.ly/v1/api/oembed?url="

  def self.get_attrs(url, options = {})
    max_width = options[:max_width] || DEFAULT_MAX_WIDTH
    embedly_url = EMBEDLY_URL + "#{url}&maxwidth=#{max_width}"
    response = HTTParty.get embedly_url
    response.parsed_response
  rescue
    {}
  end  
end
