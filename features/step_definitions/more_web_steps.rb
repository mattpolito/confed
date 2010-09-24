Then /^I should see an external link "([^"]*)"(?: to "([^"]*)")?$/ do |link_text, link_dest|
  link = find_link(link_text)
  link.should_not be_nil
  link[:target].should == '_blank'
  link[:href].should == link_dest if link_dest
end

Then /^I should not see links:$/ do |links|
  page_links = all('a')
  page_links_text = page_links.map(&:text)
  links.raw.each do |row|
    page_links_text.should_not include(row.first)
  end
end

Then /^I should see gravatar image$/ do
  page.should have_css('img.gravatar')
end
 
