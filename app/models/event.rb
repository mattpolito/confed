class Event < ActiveRecord::Base
  # Assocations
  has_many :presentations
  has_many :speakers, :through => :presentations

  # Validations
  validates :name, :presence => true
end
