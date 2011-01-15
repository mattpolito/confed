class Speaker < ActiveRecord::Base
  # Extensions
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  define_completeness_scoring do
    check :name, lambda { |per| per.name.present? }, :high
    check :title, lambda { |per| per.title.present? }, :low
    check :location, lambda { |per| per.location.present? }, :low
    check :bio, lambda { |per| per.bio.present? }, :medium
    check :company_name, lambda { |per| per.company_name.present? }, :low
    check :company_url, lambda { |per| per.company_url.present? }, :low
    check :email, lambda { |per| per.email.present? }, :medium
    check :twitter, lambda { |per| per.twitter.present? }, :medium
    check :website, lambda { |per| per.website.present? }, :medium
    check :speaker_rate_id, lambda { |per| per.speaker_rate_id.present? }, :low
    check :presentations, lambda { |per| per.presentations.present? }, :high
  end

  # Callbacks
  before_save :render_bio
  
  # Full Text Searching
  index do
    name         'A'
    company_name 'B'
    location     'C'
    # Contemplating adding twitter to index...
  end

  # Associations
  has_and_belongs_to_many :presentations

  # Validations
  validates :name, :presence => true
  validates :speaker_rate_id, :format      => {:with => /\d+-[a-z-]+$/}, 
                              :allow_blank => true
  validate :only_twitter_handle, :allow_blank => true

  # Logic
  def to_s
    name
  end

  private
    def only_twitter_handle
      return if twitter.nil?
      if twitter.match(/((http(s)?\:\/\/)?(www\.)?twitter\.com\/)/)
        self.errors[:twitter] = "must only be a handle, not URI"
      end
    end

    def render_bio
      self.rendered_bio = RDiscount.new(
        bio, :smart, :filter_html, :autolink
      ).to_html
    end
end
