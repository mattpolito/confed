namespace :embed do
  namespace:reprocess do

    desc 'Reprocess all ExternalEmbed records'
    task :all => :environment do
      p "REPROCESSING ALL EXTERNAL EMBEDS"
      ExternalEmbed.all.each do |embed|
        embed.save!
        p embed.inspect
      end
    end

    desc 'Reprocess all slideshow records'
    task :slideshows => :environment do
      p "REPROCESSING ALL SLIDESHOWS"
      Slideshow.all.each do |embed|
        embed.save!
        p embed.inspect
      end
    end
  end
end
