Given /^there (are|is) (\d+) presentation(s)?$/ do |arg1, number, arg3|
  number.to_i.times { Factory(:presentation) }
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

