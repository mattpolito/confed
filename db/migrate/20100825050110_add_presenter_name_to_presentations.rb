class AddPresenterNameToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :presenter_name, :string
  end

  def self.down
    remove_column :presentations, :presenter_name
  end
end
