class AddWebsiteToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :website, :string
  end

  def self.down
    remove_column :events, :website
  end
end
