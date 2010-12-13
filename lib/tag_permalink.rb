module TagPermalink
  def self.included(base)
    base.before_validation :create_permalink
    base.validates :permalink, :presence => true,
                               :uniqueness => true
  end

  private
    def create_permalink
      self.permalink = name.parameterize
    end
end
