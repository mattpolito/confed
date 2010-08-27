class AddTookPlaceOnToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :took_place_on, :datetime
  end

  def self.down
    remove_column :presentations, :took_place_on
  end
end
