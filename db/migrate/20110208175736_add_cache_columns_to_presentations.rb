class AddCacheColumnsToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :event_cache, :string
    add_index :presentations, :event_cache
    add_column :presentations, :speaker_cache, :string
    add_index :presentations, :speaker_cache
  end

  def self.down
    remove_column :presentations, :speaker_cache
    remove_column :presentations, :event_cache
  end
end
