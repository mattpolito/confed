class RemoveCachedSlugUniqueIndexFromPresentations < ActiveRecord::Migration
  def self.up
    remove_index :presentations, :cached_slug
    add_index  :presentations, :cached_slug
  end

  def self.down
    remove_index :presentations, :cached_slug
    add_index  :presentations, :cached_slug, :unique => true
  end
end
