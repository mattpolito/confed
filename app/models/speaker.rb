class Speaker < ActiveRecord::Base
  # Associations
  has_many :presentations

  # Validations
  validates :name, :presence => true
  validates_format_of :speakerrate_url, :with => /http:\/\/speakerrate.com\/speakers\/\d+-[a-z-]+$/

  # Full Text Searching
  index do
    name         'A'
    company_name 'B'
    location     'C'
    # Contemplating adding twitter to index...
  end

  # Logic
  def to_s
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
