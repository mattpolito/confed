# Create dummy Speakers
['Matt Polito', 'Adam Walters', 
  'Stephen Korecky', 'Chris Hallendy'].each do |speaker|
  Speaker.create!(
    :name => speaker,
    :email => "#{speaker.parameterize('_')}@example.net"
  )
end

# Create dummy presentations
Speaker.all.each_with_index do |speaker, i|
  Presentation.create!(
    :title => "Presentation Title ##{i+1}",
    :speaker => speaker,
    :event_name => "WindyCityRails 2010"
  )
end
