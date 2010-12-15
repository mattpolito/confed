class Speaker < ActiveRecord::Base
  # Extensions
  has_friendly_id :name, :use_slug => true
  
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

  # Logic
  def to_s
    name
  end
end
