module TagPermalink
  module ActsAsTaggableOn::Taggable
    module Core
      module ClassMethods
        def find_all_by_tag_permalink(permalink)
          scoped(:joins => :tags,
                 :conditions => [
                   "#{ActsAsTaggableOn::Tag.table_name}.permalink = ?", permalink
                 ]
          )
        end
      end
    end
  end

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
