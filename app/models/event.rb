class Event < ActiveRecord::Base
  # Extensions
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  define_completeness_scoring do
    check :name, lambda { |per| per.name.present? }, :high
    check :started_on, lambda { |per| per.started_on.present? }, :medium
    check :ended_on, lambda { |per| per.ended_on.present? }, :medium
    check :website, lambda { |per| per.website.present? }, :medium
    check :speaker_rate_id, lambda { |per| per.speaker_rate_id.present? }, :low
    check :presentations, lambda { |per| per.presentations.present? }, :high
  end

  # Full text indexing
  index do
    name 'A'
  end

  # Assocations
  has_many :presentations
  has_many :speakers, :through => :presentations

  # Validations
  validates :name, :presence => true

  def to_s
    self.name
  end
end
