Feature: User Registration
  In order to keep track of videos I want to watch
  As an un-registered visitor
  I would like to create a new account

  Scenario: Successful registration
    Given I am on the new user registration page
    When I fill in the following:
      | Email                 | test_user@test.com |
      | Password              | test1111           |
      | Password confirmation | test1111           |
    And I press "Sign up"
    Then I should have a new user
    And the user should not be an admin
    And I should be on the home page
