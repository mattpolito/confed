class Speaker < ActiveRecord::Base
  # Associations
  has_many :presentations

  # Validations
  validates :name, :presence => true

  def to_s
    name
  end
end
