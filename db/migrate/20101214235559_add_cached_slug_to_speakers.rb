class AddCachedSlugToSpeakers < ActiveRecord::Migration
  def self.up
    add_column :speakers, :cached_slug, :string
    add_index  :speakers, :cached_slug, :unique => true
  end

  def self.down
    remove_column :speakers, :cached_slug
  end
end
