Then /^I should see an external link "([^"]*)"(?: to "([^"]*)")?$/ do |link_text, link_dest|
  link = find_link(link_text)
  link.should_not be_nil
  link[:target].should == '_blank'
  link[:href].should == link_dest if link_dest
end

