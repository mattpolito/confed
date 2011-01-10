class Speaker < ActiveRecord::Base
  # Extensions
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
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
end
