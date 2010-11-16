class AddRenderedDescriptionToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :rendered_description, :text
  end

  def self.down
    remove_column :presentations, :rendered_description
  end
end
