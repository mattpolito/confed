class Presentation < ActiveRecord::Base
  # Constants
  EMBED_SERVICE_URL = "http://api.embed.ly/v1/api/oembed?maxwidth=250&urls="

  # Extensions
  acts_as_taggable
  
  # Full Text Searching
  index do
    title
    description
  end

  # Associations
  belongs_to :speaker
  has_many :videos
  has_many :slideshows

  # Validations
  validates :title, :presence => true
  validates :speaker_id, :presence => true, :numericality => true

  # Logic
  def request_embed_code(uris)
    HTTParty.get(EMBED_SERVICE_URL + uris.values.join(','))
  end

  def create_embedded_content(external_embed_uris)
    response = request_embed_code(external_embed_uris)
    response.each do |embed|
      case embed['type']
      when 'video'
        association = "videos"
      else
        association = "slideshows"
      end
      embed = self.send(association).build(
        :content => embed['html']
      )
      embed
    end
  end

end
