class AddSpeakerIdToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :speaker_id, :integer
    add_index :presentations, :speaker_id
  end

  def self.down
    remove_index :presentations, :column => :speaker_id
    remove_column :presentations, :speaker_id
  end
end
