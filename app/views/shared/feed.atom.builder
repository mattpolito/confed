atom_feed do |feed|
  feed.title feed_title
  feed.updated feed_updated_at

  presentations.each do |post|
    feed.entry(post) do |entry|
      entry.title "#{post.title} - #{post.event.name}"
      entry.content post.description, :type => 'html'
      entry.author do |author|
        author.name post.speakers.first.name
      end
    end
  end
end

