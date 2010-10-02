When /^I search for "([^"]*)"$/ do |search_term|
  # q is a commonly used query parameter
  When "I fill in \"q\" with \"#{search_term}\""
end

