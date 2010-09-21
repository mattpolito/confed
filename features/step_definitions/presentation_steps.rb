Given /^there is a presentation with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @presentation = Presentation.new(
      Factory.attributes_for(:presentation, attributes)
    )
    @presentation.speaker = Factory(:speaker)
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
    @presentation = @speaker.presentations.create(
      Factory.attributes_for(:presentation, attributes)
    )
  end
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

Given /^there (are|is) (\d+) presentation(s)?$/ do |arg1, number, arg3|
  number.to_i.times { Factory(:presentation, :speaker => Factory(:speaker)) }
end

Then /^I should see (\d+) presentation listing(s)?$/ do |number, arg2|
  within(:css, '#presentations') do
    page.should have_css('.presentation', :count => number.to_i)
  end
end

Then /^it should display title as a link$/ do
    page.should have_css('.presentation a.title')
end

Then /^it should display description$/ do
  page.should have_css('.presentation .description')
end

Then /^it should display presenter's name$/ do
  page.should have_css('.presentation .speaker')
end

Then /^it should display date it took place$/ do
  page.should have_css('.presentation .took_place_on')
end

Given /^I logged in as an admin user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And   %{I go to the login page}
  And   %{I fill in "user_email" with "#{email}"}
  And   %{I fill in "user_password" with "#{password}"}
  And   %{I press "Sign in"}

end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :password => password,
           :password_confirmation => password).save!
end


