Feature: Searching for presentation
  In order to find videos for a particular subject
  As a site visitor
  I want to search for presentations

  Scenario: Search with presentation results
    Given I am on the homepage
    And there is a presentation with the following:
      | Title       | MongoDB                     |
      | Description | Web scale document database |
    And there is a presentation with the following:
      | Title       | Rails 3                        |
      | Description | Talk about what's new in Rails |
    When I search for "document"
    And press "Search"
    Then I should see "MongoDB"
    But I should not see "Rails 3"

  Scenario: Search with speaker results
    Given I am on the homepage
    And a speaker with the following:
      | Name       | Adam    |
      | Location   | Chicago |
    And a speaker with the following:
      | Name       | Matt  |
      | Location   | Elgin |
    When I search for "Elgin"
    And press "Search"
    Then I should see "Matt" within "fieldset"
    But I should not see "Adam" within "fieldset"

  @wip
  Scenario: Fuzzy search results
    Given I am on the homepage
    And there is a presentation with the following:
      | Title       | MongoDB                     |
      | Description | Web scale document database |
    When I search for "mongo"
    And press "Search"
    Then I should see "MongoDB"
