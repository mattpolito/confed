class Presentation < ActiveRecord::Base
  # Extensions
  acts_as_taggable

  # Associations
  belongs_to :speaker
  has_many :videos
  has_many :slideshows

  # Validations
  validates :title, :presence => true
  validates :speaker_id, :presence => true, :numericality => true

  # Full Text Searching
  index do
    title
    description
  end
end
