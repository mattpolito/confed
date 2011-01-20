class AddShortUrlToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :short_url, :string
  end

  def self.down
    remove_column :presentations, :short_url
  end
end
