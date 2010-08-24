class Presentation < ActiveRecord::Base
  # Validations
  validates :title, :presence => true
end
