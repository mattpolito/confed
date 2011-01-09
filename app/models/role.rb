class Role < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :users

  def self.admin
    find_by_name('admin')
  end
end
