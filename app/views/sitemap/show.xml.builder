xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
 
  xml.url do
    xml.loc "http://getconfed.com"
    xml.changefreq "daily"
    xml.priority 1.0
  end
 
  unless @events.blank?
    @events.each do |event|
      xml.url do
        xml.loc event_url(event)
        xml.lastmod event.updated_at.to_date
        xml.changefreq "weekly"
        xml.priority 0.7
      end

      event.presentations.released.each do |presentation|
        xml.url do
          xml.loc event_presentation_url(presentation.event, presentation)
          xml.lastmod presentation.updated_at.to_date
          xml.changefreq "weekly"
          xml.priority 0.9
        end
      end
    end
  end
 
  unless @speakers.blank?
    @speakers.each do |speaker|
      xml.url do
        xml.loc speaker_url(speaker)
        xml.lastmod speaker.updated_at.to_date
        xml.changefreq "weekly"
        xml.priority 0.8
      end
    end
  end
 
  unless @tags.blank?
    @tags.each do |tag|
      xml.url do
        xml.loc tagged_url(tag.permalink)
        xml.changefreq "weekly"
        xml.priority 0.5
      end
    end
  end
end


