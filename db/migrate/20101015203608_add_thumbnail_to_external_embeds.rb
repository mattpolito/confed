class AddThumbnailToExternalEmbeds < ActiveRecord::Migration
  def self.up
    add_column :external_embeds, :thumbnail, :string
  end

  def self.down
    remove_column :external_embeds, :thumbnail
  end
end
