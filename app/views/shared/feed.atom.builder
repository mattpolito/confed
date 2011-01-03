atom_feed do |feed|
  feed.title feed_title
  feed.updated feed_updated_at

  unless presentations.blank?
    presentations.each do |post|
      feed.entry(post, 
        :id => post.id, 
        :url => event_presentation_url(post.event, post)
      ) do |entry|
        entry.title "#{post.title} - #{post.event.name}"
        entry.content post.rendered_description, :type => 'html'
        entry.author do |author|
          author.name post.speakers.first.name
        end
      end
    end
  end
end

