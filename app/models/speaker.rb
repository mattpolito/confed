class Speaker < ActiveRecord::Base
  # Associations
  has_many :presentations

  # Validations
  validates :name, :presence => true

  def to_s
    name
  end

  # Full Text Searching
  index do
    name         'A'
    company_name 'B'
    location     'C'
    # Contemplating adding twitter to index...
  end
end
