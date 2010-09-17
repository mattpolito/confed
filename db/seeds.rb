# Create dummy Speakers
['Matt Polito', 'Adam Walters', 
  'Stephen Korecky', 'Chris Hallendy'].each do |speaker|
  speaker = Speaker.create!(
    :name => speaker,
    :email => "#{speaker.parameterize('_')}@example.net"
  )
  p "Speaker #{speaker.name} created"
end

# Create dummy presentations
Speaker.all.each_with_index do |speaker, i|
  presentation = Presentation.create!(
    :title => "Presentation Title ##{i+1}",
    :speaker => speaker,
    :event_name => "WindyCityRails 2010"
  )
  p "Presentation #{presentation.title} created"
end

# Create dummy user
user = User.create! :email => 'd@mnit.com',
         :password => 'password',
         :password_confirmation => 'password'
p "User #{user.email} created" 
 
