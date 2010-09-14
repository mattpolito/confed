class ExternalEmbed < ActiveRecord::Base
  # Associations
  belongs_to :presentation

  # Validations
  validates :url,             :presence => true
  validates :content,         :presence => true
  validates :presentation_id, :presence => true, :numericality => true
end
