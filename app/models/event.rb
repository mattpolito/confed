class Event < ActiveRecord::Base
  # Assocations
  has_many :presentations

  # Validations
  validates :name, :presence => true
end
