class Speaker < ActiveRecord::Base
  # Associations
  has_many :presentations

  # Validations
  validates :name, :presence => true
  validates_format_of :speaker_rate_id, :with => /\d+-[a-z-]+$/

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
