class Embedly
  def self.get_attrs(url, options = {})
    embedly_url = "http://api.embed.ly/v1/api/oembed?url=#{url}"
    response = HTTParty.get embedly_url
    response.parsed_response
  rescue
    {}
  end  
end
