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
  @presentation.videos.create!(
    :content => '<object type=\"application/x-shockwave-flash\" data=\"http://vimeo.com/moogaloop.swf\" width=\"320\" height=\"240\"><param name=\"allowscriptaccess\" value=\"always\"><param name=\"allowfullscreen\" value=\"true\"><param name=\"movie\" value=\"http://vimeo.com/moogaloop.swf\"><param name=\"flashvars\" value=\"clip_id=12224199&color=00adef&fullscreen=1&server=vimeo.com&show_byline=1&show_portrait=1&show_title=1\"></object>'
  )
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
  page.should have_css('.presentation .presenter')
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


