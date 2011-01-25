class CreateSavedPresentations < ActiveRecord::Migration
  def self.up
    create_table :saved_presentations do |t|
      t.references :user
      t.references :presentation
      t.boolean :watched
      t.timestamps
    end
  end

  def self.down
    drop_table :saved_presentations
  end
end
