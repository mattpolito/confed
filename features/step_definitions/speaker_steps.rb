Given /^a speaker with the following:$/ do |table|
  new_table = table.transpose
  new_table.map_headers!{ |header| header.downcase.gsub(/\s+/, "_") }
  new_table.hashes.each do |attributes|
    @speaker = Factory(:speaker, attributes)
  end
end

Given /^a speaker$/ do
  @speaker = Factory(:speaker)
end

Given /^there (are|is) (\d+) speaker(s)?$/ do |arg1, number, arg3|
  number.to_i.times do
    Factory(:speaker)
  end
end

Then /^I should see (\d+) speaker listing(s)?$/ do |number, arg2|
  within(:css, '#speakers') do
    page.should have_css('.speaker', :count => number.to_i)
  end
end
