Given /^there is a presentation with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @presentation = Presentation.new(
      Factory.attributes_for(:presentation, attributes)
    )
    @presentation.event   = Factory(:event)
    @presentation.speakers << Factory(:speaker)
    @presentation.save!
  end
end

Given /^has video content$/ do
 Video.new(
    :url => 'http://vimeo.com/14787998',
    :content => '<iframe src=\"http://player.vimeo.com/video/14787998\" width=\"640\" height=\"480\" frameborder=\"0\"></iframe>',
    :presentation => @presentation
  ).save(:validate => false)
end

Given /^has slideshow content$/ do
 Slideshow.new(
    :url => 'http://www.slideshare.net/heidimiller/social-media-for-branding',
    :content => '<object id=\"__sse5227313\" width=\"425\" height=\"355\"><param name=\"movie\" value=\"http://static.slidesharecdn.com/swf/ssplayer2.swf?doc=personalbranding-100917221643-phpapp01&amp;stripped_title=social-media-for-branding&amp;userName=heidimiller\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowScriptAccess\" value=\"always\"><embed name=\"__sse5227313\" src=\"http://static.slidesharecdn.com/swf/ssplayer2.swf?doc=personalbranding-100917221643-phpapp01&amp;stripped_title=social-media-for-branding&amp;userName=heidimiller\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"425\" height=\"355\"></embed></object>',
    :presentation => @presentation
  ).save(:validate => false)
end

Given /^the speaker has a presentation with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    attributes.merge!({:event_id => Factory(:event).id})
    @presentation = @speaker.presentations.create(
      Factory.attributes_for(:presentation, attributes)
    )
  end
end

Given /^I am hitting an external service for url shortening$/ do
  bitly = mock(Bitly)
  Bitly.stub(:new).and_return(bitly)
  bitly.stub(:shorten).and_return(mock(Bitly, :short_url => 'http://bit.ly/xhr0'))
end

Then /^I should see the presentation video$/ do
  page.should have_css('.presentation .video')
end

Then /^I should see the presentation slideshow$/ do
  page.should have_css('.presentation .slideshow')
end

Then /^I should see the event name$/ do
  page.should have_css('.presentation .event.name',
                      :text => "Your mom's house")
end

Given /^there (are|is) (\d+) (unreleased )?presentation(s)?$/ do |arg1, number, unreleased, arg3|
  released = unreleased == "unreleased " ? false : true
  number.to_i.times do
    Factory(:presentation, 
            :speakers => [Factory(:speaker)],
            :event   => Factory(:event),
            :released => released
    )
  end
end

Given /^the presentation has the tags?: "([^"]*)"$/ do |tags|
  @presentation.update_attributes :tag_list => tags
end

Then /^I should see (\d+) presentation listing(s)?$/ do |number, arg2|
  page.should have_css('.presentation', :count => number.to_i)
end

Then /^it should display date it took place$/ do
  page.should have_css('.presentation .took_place_on')
end
