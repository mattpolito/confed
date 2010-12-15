class AddCachedSlugToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :cached_slug, :string
    add_index  :presentations, :cached_slug, :unique => true
  end

  def self.down
    remove_column :presentations, :cached_slug
  end
end
