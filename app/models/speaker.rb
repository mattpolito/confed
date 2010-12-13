class Speaker < ActiveRecord::Base
  extend Gravatarify
  # Associations
  has_and_belongs_to_many :presentations

  # Validations
  validates :name, :presence => true
  validates :speaker_rate_id, :format => {:with => /\d+-[a-z-]+$/}, :allow_blank => true

  # Full Text Searching
  index do
    name         'A'
    company_name 'B'
    location     'C'
    # Contemplating adding twitter to index...
  end

  # Logic
  def avatar_url
    if twitter.present?
      Twitter.profile_image(twitter, :size => 'bigger')
    else
      default_url = CGI.escape("http://confed.local/images/guest.png")
      gravatar_id = Digest::MD5.hexdigest(email.try(:downcase))
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=73&d=#{default_url}"
    end
  end

  def to_s
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
