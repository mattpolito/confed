class ExternalEmbed < ActiveRecord::Base
  # Constants
  URL_REGEX = /^https?\:\/\/(www\.)?\w+-?\w+\.\w{2,3}\/?[a-zA-Z0-9\/-]+/

  # Associations
  belongs_to :presentation

  # Validations
  validates :url,     :presence => true, :format => { :with => URL_REGEX }
  validates :content, :presence => true
end
