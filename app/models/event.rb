class Event < ActiveRecord::Base
  # Extensions
  has_friendly_id :name, :use_slug => true

  # Full text indexing
  index do
    name 'A'
  end

  # Assocations
  has_many :presentations
  has_many :speakers, :through => :presentations

  # Validations
  validates :name, :presence => true

  def to_s
    self.name
  end
end
