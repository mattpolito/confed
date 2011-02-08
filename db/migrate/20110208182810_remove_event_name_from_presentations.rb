class RemoveEventNameFromPresentations < ActiveRecord::Migration
  def self.up
    remove_column :presentations, :event_name
  end

  def self.down
    add_column :presentations, :event_name, :string
  end
end
