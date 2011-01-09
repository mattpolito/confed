Then /^I should have a new user$/ do
  User.count.should == (@user_count + 1)
  @user = User.last
end

Then /^the user should not be an admin$/ do
  @user.should_not have_role(:admin)
end

