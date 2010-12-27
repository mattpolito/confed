class Presentation < ActiveRecord::Base
  # Constants
  EMBED_SERVICE_URL = "http://api.embed.ly/v1/api/oembed?maxwidth=250&urls="

  # Callbacks
  before_save :render_description
  before_save :update_tag_cache

  # Attributes
  attr_protected :tag_cache

  # Extensions
  acts_as_taggable
  has_friendly_id :title, :use_slug => true, 
                          :scope => :event, 
                          :approximate_ascii => true
  
  # Full Text Searching
  index do
    tag_cache   'A'
    title       'B'
    description 'C'
  end

  # Associations
  belongs_to :event
  has_and_belongs_to_many :speakers
  has_many :videos
  accepts_nested_attributes_for :videos,     :reject_if => :all_blank
  has_many :slideshows
  accepts_nested_attributes_for :slideshows, :reject_if => :all_blank

  # Scopes
  default_scope :order => "#{quoted_table_name}.id DESC"
  scope :released, :conditions => { :released => true }

  # Validations
  validates :title,      :presence => true
  validates :event_id,   :presence => true, :numericality => true

  # Logic
  def thumbnail
    return "" unless videos.present? && videos.first.thumbnail.present?  
    videos.first.thumbnail
  end

  def unreleased?
    !released?
  end

  private
    def render_description
      self.rendered_description = RDiscount.new(
        description, :smart, :filter_html, :autolink
      ).to_html
    end

    def update_tag_cache
      self.tag_cache = self.tag_list.to_s
    end
end
