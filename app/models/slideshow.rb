class Slideshow < ExternalEmbed
  # Callbacks
  before_validation :set_attrs_via_embedly, :unless => Proc.new { |v| v.url.blank? }
 
  # Logic
  def set_attrs_via_embedly
    attrs = Embedly.get_attrs(url)
    errors[:base] << "is not a slideshow" if attrs['type'] == "video"
    self.content = attrs['html']
  end
end
