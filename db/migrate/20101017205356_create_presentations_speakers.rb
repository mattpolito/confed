class CreatePresentationsSpeakers < ActiveRecord::Migration
  def self.up
    create_table :presentations_speakers, :id => false do |t|
      t.references :presentation, :speaker
    end
    
    # Indexes
    add_index :presentations_speakers, 
              [:presentation_id, :speaker_id],
              :unique => true

    Presentation.all.each do |presentation|
      return unless presentation.speaker_id.present?
      Presentation.connection.execute(%{
        INSERT INTO
          presentations_speakers
        (presentation_id, speaker_id)
        VALUES
          (#{presentation.id}, #{presentation.speaker_id});
      })
    end
  rescue => e
    puts "Error: #{e}"
  end

  def self.down
    drop_table :presentations_speakers
  end
end
