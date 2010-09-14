Feature: Searching for presentation
  In order to find videos for a particular subject
  As a site visitor
  I want to search for presentations

  Scenario: Search with results
    Given I am on the homepage
    And there is a presentation with the following:
      | Title       | MongoDB                     |
      | Description | Web scale document database |
    And there is a presentation with the following:
      | Title       | Rails 3                         |
      | Description | Talk about what's new in Rails  |
    When I fill in "Search" with "document"
    And press "Search"
    Then I should see "MongoDB"
    But I should not see "Rails 3"
