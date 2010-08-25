class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.string :name
      t.string :title
      t.string :location
      t.string :bio
      t.string :company_name
      t.string :company_url
      t.string :email
      t.string :twitter
      t.string :blog_url
      t.string :speakerrate_url

      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
  end
end
