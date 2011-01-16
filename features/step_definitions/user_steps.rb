Given /^I have the role of "([^\"]*)"$/ do |role|
  @user.roles << Role.find_or_create_by_name(role)
end

Given /^I am not authenticated$/ do
    visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
    :login => login,
    :password => password,
    :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to the login page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should have a new user$/ do
  User.count.should == (@user_count + 1)
  @user = User.last
end

Then /^the user should not be an admin$/ do
  @user.should_not have_role(:admin)
end

