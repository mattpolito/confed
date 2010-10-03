class ChangeSpeakerrateUrlToSpeakerRateId < ActiveRecord::Migration
  def self.up
    rename_column :speakers, :speakerrate_url, :speaker_rate_id
  end

  def self.down
    rename_column :speakers, :speaker_rate_id, :speakerrate_url
  end
end
