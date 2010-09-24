# Clean database
[Speaker, Event, Presentation, User, ExternalEmbed].each(&:delete_all)

# Create dummy Speakers
['Matt Polito', 'Adam Walters', 
  'Stephen Korecky', 'Chris Hallendy'].each do |speaker|
  speaker = Speaker.create!(
    :name => speaker,
    :email => "#{speaker.parameterize('_')}@example.net"
  )
  p "Speaker #{speaker.name} created"
end

# Create dummy events
['WindyCityRails 2010', 'WindyCityRails 2009',
  'RailsConf 2010', 'Future of Webapps'].each do |event|
  event = Event.create!(:name => event)
  p "Event #{event.name} created"
end

# Create dummy presentations
events = Event.all
speakers = Speaker.all
20.times do |i|
  presentation = Presentation.create!(
    :title   => "Title ##{i+1}",
    :speaker => speakers[rand(speakers.size)],
    :event   => events[rand(events.size)]
  )
  p "Presentation #{presentation.title} by #{presentation.speaker.name} @ #{presentation.event.name}"
end

# Create dummy user
user = User.create! :email => 'd@mnit.com',
         :password => 'password',
         :password_confirmation => 'password'
p "User #{user.email} created" 
 
