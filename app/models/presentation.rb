class Presentation < ActiveRecord::Base
  belongs_to :presentation

  # Extensions
  include AutoHtmlFor
  auto_html_for :video do
    vimeo
    youtube
  end

  # Validations
  validates :title, :presence => true
end
