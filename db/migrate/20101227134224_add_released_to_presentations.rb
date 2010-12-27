class AddReleasedToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :released, :boolean
    add_index  :presentations, :released
  end

  def self.down
    remove_column :presentations, :released
  end
end
