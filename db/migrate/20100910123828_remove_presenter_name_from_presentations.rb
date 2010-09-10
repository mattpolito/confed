class RemovePresenterNameFromPresentations < ActiveRecord::Migration
  def self.up
    remove_column :presentations, :presenter_name
  end

  def self.down
    add_column :presentations, :presenter_name, :string
  end
end
