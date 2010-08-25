class Presentation < ActiveRecord::Base
  # Extensions
  include AutoHtmlFor
  auto_html_for :video do
    vimeo
    youtube
  end

  # Validations
  validates :title, :presence => true
end
