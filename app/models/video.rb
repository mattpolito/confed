class Video < ExternalEmbed
  # Callbacks
  before_validation :set_attrs_via_embedly, :if => Proc.new { |v| v.url? }
 
  # Logic
  def set_attrs_via_embedly
    attrs = Embedly.get_attrs(url)
    errors[:base] << "is not a video" unless attrs['type'] == 'video'
    self.content   = attrs['html']
    self.thumbnail = attrs['thumbnail_url']
  end
end
