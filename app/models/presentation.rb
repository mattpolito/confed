class Presentation < ActiveRecord::Base
  # Extensions
  include AutoHtmlFor
  auto_html_for :video do
    vimeo
    youtube
  end

  acts_as_taggable

  # Associations
  belongs_to :speaker

  # Validations
  validates :title, :presence => true
  validates :speaker_id, :presence => true, :numericality => true

  # Full Text Searching
  index do
    title
    description
  end
end
