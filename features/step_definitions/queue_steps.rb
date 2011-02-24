Then /^I should have (\d+) saved presentation$/ do |count|
  @user.watch_list.presentations.should have(count.to_i).presentations
end
