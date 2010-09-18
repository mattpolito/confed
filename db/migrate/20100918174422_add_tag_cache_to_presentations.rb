class AddTagCacheToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :tag_cache, :string
  end

  def self.down
    remove_column :presentations, :tag_cache
  end
end
