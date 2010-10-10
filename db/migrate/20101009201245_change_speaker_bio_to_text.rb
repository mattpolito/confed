class ChangeSpeakerBioToText < ActiveRecord::Migration
  def self.up
    change_column :speakers, :bio, :text
  end

  def self.down
    change_column :speakers, :bio, :string
  end
end
