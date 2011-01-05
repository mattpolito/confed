Given /^there is an event with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @event = Factory(:event, attributes)
  end
end

Given /^ an event$/ do
  @event = Factory(:event)
end

Given /^there (are|is) (\d+) (unreleased )?event(s)?$/ do |arg1, number, unreleased, arg3|
  released = unreleased == "unreleased " ? false : true
  number.to_i.times do
    Factory(:event)
  end
end

Then /^I should see (\d+) event listing(s)?$/ do |number, arg2|
  page.should have_css('.event', :count => number.to_i)
end
