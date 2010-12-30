atom_feed do |feed|
  feed.title feed_title
  feed.updated feed_updated_at

  presentations.each do |post|
    feed.entry([post.event, post]) do |entry|
      entry.title "#{post.title} - #{post.event.name}"
      entry.published post.created_at
      entry.updated post.updated_at
      entry.content post.description, :type => 'html'
      entry.author do |author|
        author.name post.speakers.first.name
      end
    end
  end
end

