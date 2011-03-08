Then /^I should see "([^"]*)" within watch list$/ do |title|
  And %{I should see "#{title}" within "aside"}
end
