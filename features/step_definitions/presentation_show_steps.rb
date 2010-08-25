Given /^there is a presentation with video content$/ do
  @presentation = Factory(:presentation, 
    :video => 'http://www.youtube.com/watch?v=WdsGihou8J4',
    :presenter_name => 'Johnny Bravo',
    :event_name => "Your mom's house")
end

Then /^I should see the presentation title$/ do
  page.should have_css('.presentation .title')
end

Then /^I should see the presentation description$/ do
  page.should have_css('.presentation .description')
end

Then /^I should see the presentation video$/ do
  page.should have_css('.presentation .video')
end

Then /^I should see the presenter's name$/ do
  page.should have_css('.presentation .presenter.name',
                      :text => 'Johnny Bravo')
end

Then /^I should see the event name$/ do
  page.should have_css('.presentation .event.name',
                      :text => "Your mom's house")
end

