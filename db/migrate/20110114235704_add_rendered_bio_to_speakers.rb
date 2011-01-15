class AddRenderedBioToSpeakers < ActiveRecord::Migration
  def self.up
    add_column :speakers, :rendered_bio, :text
  end

  def self.down
    remove_column :speakers, :rendered_bio
  end
end
