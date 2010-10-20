class Presentation < ActiveRecord::Base
  # Constants
  EMBED_SERVICE_URL = "http://api.embed.ly/v1/api/oembed?maxwidth=250&urls="

  # Callbacks
  before_save :update_tag_cache

  # Attributes
  attr_protected :tag_cache

  # Extensions
  acts_as_taggable
  
  # Full Text Searching
  index do
    tag_cache   'A'
    title       'B'
    description 'C'
  end

  # Associations
  belongs_to :speaker
  belongs_to :event
  has_many :videos
  accepts_nested_attributes_for :videos,     :reject_if => :all_blank
  has_many :slideshows
  accepts_nested_attributes_for :slideshows, :reject_if => :all_blank

  # Validations
  validates :title,      :presence => true
  validates :speaker_id, :presence => true, :numericality => true
  validates :event_id,   :presence => true, :numericality => true

  # Logic
  def thumbnail
    return "" unless videos.present? && videos.first.thumbnail.present?  
    videos.first.thumbnail
  end

  private
    def update_tag_cache
      self.tag_cache = self.tag_list.to_s
    end
end
