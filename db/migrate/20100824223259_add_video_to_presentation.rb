class AddVideoToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :video, :text
  end

  def self.down
    remove_column :presentations, :video
  end
end
