class Slideshow < ExternalEmbed
  # Callbacks
  before_validation :set_attrs_via_embedly, :unless => Proc.new { |v| v.url.blank? }
 
  # Logic
  def set_attrs_via_embedly
    attrs = Embedly.get_attrs(url)
    unless attrs['provider_name'].match(/Slide|Scribd/)
      errors[:base] << "is not a slideshow"
    end
    self.content   = attrs['html']
    self.thumbnail = attrs['thumbnail_url']
  end
end
