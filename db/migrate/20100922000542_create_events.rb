class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :null => false
      t.datetime :started_on
      t.datetime :ended_on

      t.timestamps
    end
    add_column :presentations, :event_id, :integer
  end

  def self.down
    remove_column :presentations, :event_id
    drop_table :events
  end
end
