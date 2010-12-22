Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), value)]") 
end

Then /^I should see an external link "([^"]*)"(?: to "([^"]*)")?$/ do |link_text, link_dest|
  link = find_link(link_text)
  link.should_not be_nil
  link[:target].should == '_blank'
  link[:href].should == link_dest if link_dest
end

Then /^I should see a link "([^"]*)"(?: to "([^"]*)")?(?: within "([^"]*)")?$/ do |link_text, link_dest, selector|
  with_scope(selector) do 
    link = find_link(link_text)
    link.should_not be_nil
    link[:href].should == link_dest if link_dest
  end
end

Then /^I should not see links:$/ do |links|
  page_links = all('a')
  page_links_text = page_links.map(&:text)
  links.raw.each do |row|
    page_links_text.should_not include(row.first)
  end
end

Then /^I should see avatar image$/ do
  page.should have_css('img.avatar')
end

Then /^I should see pagination links$/ do
  page.should have_css('.pagination')
end

Then /^I should see (\d+) pagination link(s)?$/ do |number, arg2|
  page.should have_css('.pagination')
  number.to_i.times do |i|
    page.should have_css(".pagination a[href$='page=#{i.to_i + 1}']") unless i == 0
  end
  page.should_not have_css(".pagination a[href$='page=#{number.to_i + 1}']")
end
    
Then /^I should see page title as "(.*)"$/ do |title|
  assert_equal title, page.find(:css, 'title').text
end

