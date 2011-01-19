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
  define_completeness_scoring do
    check :title, lambda { |per| per.title.present? }, :high
    check :description, lambda { |per| per.description.present? }, :medium
    check :took_place_on, lambda { |per| per.took_place_on.present? }, :low
    check :videos, lambda { |per| per.videos.present? }, :high
    check :slideshows, lambda { |per| per.slideshows.present? }, :medium
  end
  
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
  scope :unreleased, :conditions => { :released => false }

  # Validations
  validates :title,      :presence => true
  validates :event_id,   :presence => true, :numericality => true

  # Logic
  def build_extras
    speakers.build unless speakers.present?
    videos.build unless videos.present?
    slideshows.build unless slideshows.present?
  end

  def thumbnail
    return "" unless videos.present? && videos.first.thumbnail.present?  
    videos.first.thumbnail
  end

  def unreleased?
    !released?
  end

  private
    def render_description
      return unless description?
      self.rendered_description = RDiscount.new(
        description, :smart, :filter_html, :autolink
      ).to_html
    end

    def update_tag_cache
      self.tag_cache = self.tag_list.to_s
    end
end
