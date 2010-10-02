class ChangeBlogUrlToWebsite < ActiveRecord::Migration
  def self.up
    rename_column :speakers, :blog_url, :website
  end

  def self.down
    rename_column :speakers, :website, :blog_url
  end
end
