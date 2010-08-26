Given /^there are (\d+) presentations$/ do |number|
  number.to_i.times { Factory(:presentation) }
end

Then /^I should see the (\d+) most recent presentations$/ do |number|
  within(:css, '#presentations') do
    page.should have_css('.presentation', :count => number.to_i)
  end
end

