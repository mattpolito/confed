class AddCachedSlugToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :cached_slug, :string
    add_index  :events, :cached_slug, :unique => true
  end

  def self.down
    remove_column :events, :cached_slug
  end
end
