Feature: View my watch list
  In order to watch presentations I've saved for later
  As a site user
  I want to view a list of presentations I've saved

  Scenario: Watch list on homepage
    Given I logged in as a user
    And   I have the following saved presentations:
      | Title | Description |
      | Rails 3 Update | All the new stuff |
      | Rspec Tutorial | BDD and all that shit |
    When  I am on the home page
    Then  I should see "Watch List"
