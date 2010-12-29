class AddingMissingIndexes < ActiveRecord::Migration
  def self.up
    add_index :external_embeds, :presentation_id
    add_index :presentations, :event_id
    add_index :roles_users, [:user_id, :role_id], :unique => true
  end

  def self.down
    remove_index :roles_users, :column => [:user_id, :role_id]
    remove_index :presentations, :column => :event_id
    remove_index :external_embeds, :column => :presentation_id
  end
end
