class Event < ActiveRecord::Base
  # Assocations
  has_many :presentations
  has_many :speakers, :through => :presentations

  # Full text indexing
  index do
    name 'A'
  end

  # Validations
  validates :name, :presence => true
end
