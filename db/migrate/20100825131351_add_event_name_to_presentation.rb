class AddEventNameToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :event_name, :string
  end

  def self.down
    remove_column :presentations, :event_name
  end
end
