class AddSpeakerRateIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :speaker_rate_id, :string
  end

  def self.down
    remove_column :events, :speaker_rate_id
  end
end
