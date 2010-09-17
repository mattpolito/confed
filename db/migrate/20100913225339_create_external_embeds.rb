class CreateExternalEmbeds < ActiveRecord::Migration
  def self.up
    create_table :external_embeds do |t|
      t.string :url
      t.text :content, :null => false
      t.string :type, :null => false
      t.references :presentation, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :external_embeds
  end
end
