Then /^I should have (\d+) saved presentation$/ do |count|
  @user.saved_presentations.should have(count.to_i).presentations
end
